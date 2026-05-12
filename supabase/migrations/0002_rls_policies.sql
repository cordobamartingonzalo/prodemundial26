-- =============================================================================
-- 0002_rls_policies.sql
-- Row Level Security para todas las tablas del Prode Mundial 2026
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Funciones helper con SECURITY DEFINER
--
-- Necesarias por dos motivos:
--
-- 1. is_tournament_member: evita recursión infinita en las políticas de
--    tournament_members. Con RLS activo, una subquery sobre la misma tabla
--    también pasa por RLS → loop. SECURITY DEFINER corre como postgres,
--    sin pasar por RLS.
--
-- 2. join_private_tournament: RLS solo puede inspeccionar el row que se
--    inserta. El invite_code vive en tournaments, no en tournament_members,
--    así que no es verificable con WITH CHECK puro.
-- ---------------------------------------------------------------------------

create or replace function is_tournament_member(p_tournament_id uuid)
returns boolean
language sql
security definer
stable
set search_path = public
as $$
  select exists (
    select 1 from tournament_members
    where tournament_id = p_tournament_id
    and   user_id       = auth.uid()
  );
$$;

-- RPC pública para unirse a un torneo privado con invite_code.
-- El cliente llama: supabase.rpc('join_private_tournament', { tournament_id, invite_code })
create or replace function join_private_tournament(
  p_tournament_id uuid,
  p_invite_code   text
)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_type        tournament_type;
  v_invite_code text;
begin
  select type, invite_code
  into   v_type, v_invite_code
  from   tournaments
  where  id = p_tournament_id;

  if not found then
    raise exception 'Torneo no encontrado';
  end if;

  if v_type <> 'private' then
    raise exception 'Usá INSERT directo para torneos públicos';
  end if;

  if v_invite_code is distinct from p_invite_code then
    raise exception 'Código de invitación incorrecto';
  end if;

  insert into tournament_members (tournament_id, user_id)
  values (p_tournament_id, auth.uid())
  on conflict do nothing;
end;
$$;

-- Solo usuarios autenticados pueden llamar a estas funciones
revoke execute on function is_tournament_member(uuid)              from public;
revoke execute on function join_private_tournament(uuid, text)     from public;
grant  execute on function is_tournament_member(uuid)              to authenticated;
grant  execute on function join_private_tournament(uuid, text)     to authenticated;

-- =============================================================================
-- TEAMS — lectura pública, escritura solo desde service_role
-- =============================================================================

alter table teams enable row level security;

create policy "teams_select_public"
on teams for select
using (true);

-- Sin políticas de INSERT / UPDATE / DELETE → denegado para anon y authenticated.
-- Solo el service_role (que bypasea RLS) puede escribir.

-- =============================================================================
-- MATCHES — lectura pública, escritura solo desde service_role
-- =============================================================================

alter table matches enable row level security;

create policy "matches_select_public"
on matches for select
using (true);

-- =============================================================================
-- PREDICTIONS
-- =============================================================================

alter table predictions enable row level security;

-- SELECT: el usuario ve siempre sus propias predictions.
-- Predictions de otros usuarios solo cuando el partido ya terminó
-- (evita que alguien copie antes del pitazo).
create policy "predictions_select"
on predictions for select
to authenticated
using (
  user_id = auth.uid()
  or exists (
    select 1 from matches
    where matches.id     = predictions.match_id
    and   matches.status = 'finished'
  )
);

-- INSERT: solo con su propio user_id, y solo si el partido
-- está en 'scheduled' y el kickoff_at todavía no llegó.
create policy "predictions_insert"
on predictions for insert
to authenticated
with check (
  user_id = auth.uid()
  and exists (
    select 1 from matches
    where matches.id          = match_id
    and   matches.status      = 'scheduled'
    and   matches.kickoff_at  > now()
  )
);

-- UPDATE: mismo criterio que INSERT. USING filtra qué rows puede tocar,
-- WITH CHECK valida el nuevo estado del row.
create policy "predictions_update"
on predictions for update
to authenticated
using (
  user_id = auth.uid()
  and exists (
    select 1 from matches
    where matches.id         = predictions.match_id
    and   matches.status     = 'scheduled'
    and   matches.kickoff_at > now()
  )
)
with check (
  user_id = auth.uid()
  and exists (
    select 1 from matches
    where matches.id         = match_id
    and   matches.status     = 'scheduled'
    and   matches.kickoff_at > now()
  )
);

-- DELETE: sin política → denegado desde el cliente.

-- =============================================================================
-- TOURNAMENTS
-- =============================================================================

alter table tournaments enable row level security;

-- SELECT: torneos públicos visibles para todos los autenticados.
-- Torneos privados: solo el creador o los members.
-- El creador siempre ve su torneo aunque todavía no se haya sumado como member.
create policy "tournaments_select"
on tournaments for select
to authenticated
using (
  type = 'public'
  or creator_id = auth.uid()
  or is_tournament_member(id)
);

-- INSERT: cualquier usuario autenticado puede crear un torneo,
-- pero creator_id debe ser su propio uid.
create policy "tournaments_insert"
on tournaments for insert
to authenticated
with check (creator_id = auth.uid());

-- UPDATE / DELETE: solo el creador.
create policy "tournaments_update"
on tournaments for update
to authenticated
using    (creator_id = auth.uid())
with check (creator_id = auth.uid());

create policy "tournaments_delete"
on tournaments for delete
to authenticated
using (creator_id = auth.uid());

-- =============================================================================
-- TOURNAMENT_MEMBERS
-- =============================================================================

alter table tournament_members enable row level security;

-- SELECT: el usuario ve los members de los torneos donde él participa.
-- is_tournament_member() bypasea RLS para evitar recursión infinita.
create policy "tournament_members_select"
on tournament_members for select
to authenticated
using (is_tournament_member(tournament_id));

-- INSERT: solo para torneos públicos y solo con su propio user_id.
-- Para torneos privados → usar la RPC join_private_tournament().
create policy "tournament_members_insert_public"
on tournament_members for insert
to authenticated
with check (
  user_id = auth.uid()
  and exists (
    select 1 from tournaments
    where tournaments.id   = tournament_id
    and   tournaments.type = 'public'
  )
);

-- DELETE: el usuario se saca a sí mismo, o el creador del torneo saca a otros.
create policy "tournament_members_delete"
on tournament_members for delete
to authenticated
using (
  user_id = auth.uid()
  or exists (
    select 1 from tournaments
    where tournaments.id          = tournament_id
    and   tournaments.creator_id  = auth.uid()
  )
);

-- =============================================================================
-- SPECIAL_PREDICTIONS — políticas básicas (v2)
-- =============================================================================

alter table special_predictions enable row level security;

-- SELECT: cada usuario ve solo sus propias predicciones especiales.
create policy "special_predictions_select"
on special_predictions for select
to authenticated
using (user_id = auth.uid());

-- INSERT / UPDATE: solo propias y solo si todavía no están bloqueadas.
create policy "special_predictions_insert"
on special_predictions for insert
to authenticated
with check (
  user_id   = auth.uid()
  and locked_at is null
);

create policy "special_predictions_update"
on special_predictions for update
to authenticated
using    (user_id = auth.uid() and locked_at is null)
with check (user_id = auth.uid() and locked_at is null);

-- DELETE: sin política → denegado desde el cliente.

-- =============================================================================
-- TRIGGER: agregar creador como miembro automáticamente
--
-- Cuando un usuario crea un torneo, se lo agrega a tournament_members de forma
-- automática. Sin esto, el creador no podría ver su propio torneo privado
-- (la política SELECT de tournaments usa is_tournament_member()).
-- =============================================================================

create or replace function add_creator_as_member()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into tournament_members (tournament_id, user_id)
  values (NEW.id, NEW.creator_id)
  on conflict do nothing;
  return NEW;
end;
$$;

create trigger add_creator_as_member
  after insert on tournaments
  for each row execute function add_creator_as_member();
