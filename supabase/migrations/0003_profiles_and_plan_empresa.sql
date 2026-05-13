-- =============================================================================
-- 0003_profiles_and_plan_empresa.sql
-- Perfiles de usuario, plan empresa para torneos y Ranking Mundial automático
-- =============================================================================


-- ====== SECCIÓN 1: TABLA PROFILES ======

-- ---------------------------------------------------------------------------
-- profiles
-- Extiende auth.users con datos del perfil público del usuario.
-- Se crea automáticamente vía trigger al registrarse. No se puede insertar
-- desde el cliente (solo service_role o triggers SECURITY DEFINER).
-- ---------------------------------------------------------------------------

create table profiles (
  id          uuid        primary key references auth.users (id) on delete cascade,
  full_name   text,
  avatar_url  text,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

comment on table profiles is 'Perfil público de cada usuario. Se crea automáticamente al registrarse.';
comment on column profiles.full_name  is 'Puede venir de raw_user_meta_data (full_name o name según proveedor OAuth).';
comment on column profiles.avatar_url is 'Puede venir de raw_user_meta_data (avatar_url o picture según proveedor OAuth).';

-- Trigger BEFORE UPDATE: mantiene updated_at sincronizado (reutiliza set_updated_at de 0001)
create trigger profiles_set_updated_at
  before update on profiles
  for each row execute function set_updated_at();

-- ---------------------------------------------------------------------------
-- RLS de profiles
-- ---------------------------------------------------------------------------

alter table profiles enable row level security;

-- SELECT: cualquier usuario autenticado puede ver perfiles (para mostrar nombres en rankings)
create policy "profiles_select"
on profiles for select
to authenticated
using (true);

-- UPDATE: solo el propio usuario puede editar su perfil
create policy "profiles_update"
on profiles for update
to authenticated
using    (id = auth.uid())
with check (id = auth.uid());

-- INSERT / DELETE: sin política para authenticated → denegado desde el cliente.
-- Solo triggers SECURITY DEFINER y service_role pueden insertar/borrar.

-- ---------------------------------------------------------------------------
-- Función trigger: crea el perfil automáticamente cuando se registra un usuario.
-- Soporta registro por email y OAuth (Google manda 'name' y 'picture').
-- ---------------------------------------------------------------------------

create or replace function handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into profiles (id, full_name, avatar_url)
  values (
    NEW.id,
    coalesce(
      NEW.raw_user_meta_data->>'full_name',
      NEW.raw_user_meta_data->>'name'
    ),
    coalesce(
      NEW.raw_user_meta_data->>'avatar_url',
      NEW.raw_user_meta_data->>'picture'
    )
  )
  on conflict (id) do nothing;
  return NEW;
end;
$$;

create trigger on_auth_user_created_create_profile
  after insert on auth.users
  for each row execute function handle_new_user();


-- ====== SECCIÓN 2: CAMPOS PLAN EMPRESA EN TOURNAMENTS ======

-- ---------------------------------------------------------------------------
-- Permitir creator_id NULL para torneos de sistema (ej: Ranking Mundial).
-- Los torneos creados por usuarios siguen requiriendo creator_id = auth.uid()
-- gracias a la RLS policy "tournaments_insert" existente en 0002
-- (NULL = auth.uid() evalúa a NULL, por lo que queda bloqueado desde el cliente).
-- ---------------------------------------------------------------------------

alter table tournaments
  alter column creator_id drop not null;

-- Nuevos campos para el plan empresa
alter table tournaments
  add column plan_type   text        not null default 'free'
    constraint tournaments_plan_type_check check (plan_type in ('free', 'paid')),
  add column max_members int         not null default 30,
  add column paid_until  timestamptz;

comment on column tournaments.plan_type   is 'free: hasta 30 miembros. paid: límite ampliado mientras paid_until esté vigente.';
comment on column tournaments.max_members is 'Máximo de participantes permitidos en el torneo.';
comment on column tournaments.paid_until  is 'Hasta cuándo está activo el plan pago. NULL para plan free.';

-- ---------------------------------------------------------------------------
-- Ajustar add_creator_as_member (definido en 0002) para ignorar torneos de
-- sistema donde creator_id es NULL. Sin este guard, intentaría insertar
-- (tournament_id, NULL) en tournament_members, lo que viola el NOT NULL de user_id.
-- ---------------------------------------------------------------------------

create or replace function add_creator_as_member()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  -- Torneos de sistema (creator_id NULL) no tienen dueño que agregar como miembro
  if NEW.creator_id is null then
    return NEW;
  end if;

  insert into tournament_members (tournament_id, user_id)
  values (NEW.id, NEW.creator_id)
  on conflict do nothing;
  return NEW;
end;
$$;


-- ====== SECCIÓN 3: TABLA PLAN_UPGRADE_REQUESTS ======

-- ---------------------------------------------------------------------------
-- plan_upgrade_requests
-- Formularios de torneos que quieren superar el límite del plan free.
-- Solo el creator del torneo puede crear y ver las requests de su torneo.
-- El admin gestiona el proceso cambiando status y anotando en admin_notes
-- directamente desde Supabase (service_role).
-- ---------------------------------------------------------------------------

create table plan_upgrade_requests (
  id                uuid        primary key default gen_random_uuid(),
  tournament_id     uuid        not null references tournaments (id) on delete cascade,
  requester_user_id uuid        references auth.users (id) on delete set null,
  contact_whatsapp  text,
  contact_email     text,
  message           text,
  status            text        not null default 'pending'
    constraint plan_upgrade_requests_status_check
      check (status in ('pending', 'contacted', 'paid', 'rejected')),
  created_at        timestamptz not null default now(),
  resolved_at       timestamptz,
  admin_notes       text,

  -- Al menos un canal de contacto debe estar presente y no vacío
  constraint plan_upgrade_requests_contact_required check (
    (contact_whatsapp is not null and contact_whatsapp <> '')
    or (contact_email  is not null and contact_email  <> '')
  )
);

comment on table plan_upgrade_requests  is 'Solicitudes de ampliación de plan para torneos privados que superan el límite free.';
comment on column plan_upgrade_requests.admin_notes  is 'Notas internas del admin al gestionar la solicitud. Solo modificable por service_role.';
comment on column plan_upgrade_requests.resolved_at  is 'Cuándo se resolvió la solicitud (contactado, pagado o rechazado).';

-- Índices
create index idx_plan_upgrade_requests_tournament_id
  on plan_upgrade_requests (tournament_id);

create index idx_plan_upgrade_requests_status
  on plan_upgrade_requests (status);

create index idx_plan_upgrade_requests_created_at
  on plan_upgrade_requests (created_at desc);

-- ---------------------------------------------------------------------------
-- RLS de plan_upgrade_requests
-- ---------------------------------------------------------------------------

alter table plan_upgrade_requests enable row level security;

-- SELECT: solo el creator del torneo ve las requests de su torneo.
-- service_role ve todas (bypasea RLS automáticamente).
create policy "plan_upgrade_requests_select"
on plan_upgrade_requests for select
to authenticated
using (
  exists (
    select 1 from tournaments t
    where t.id         = tournament_id
    and   t.creator_id = auth.uid()
  )
);

-- INSERT: solo el creator del torneo, y solo si el torneo es privado y plan free.
create policy "plan_upgrade_requests_insert"
on plan_upgrade_requests for insert
to authenticated
with check (
  requester_user_id = auth.uid()
  and exists (
    select 1 from tournaments t
    where t.id         = tournament_id
    and   t.creator_id = auth.uid()
    and   t.type       = 'private'
    and   t.plan_type  = 'free'
  )
);

-- UPDATE / DELETE: sin política para authenticated → solo service_role (admin).


-- ====== SECCIÓN 4: TORNEO "RANKING MUNDIAL" Y AUTO-INSCRIPCIÓN ======

-- ---------------------------------------------------------------------------
-- Torneo de sistema: Ranking Mundial 2026
--
-- ID fijo para poder referenciarlo desde código y triggers sin buscar por nombre.
-- creator_id NULL indica que es un torneo de sistema sin dueño.
-- plan_type 'paid' y paid_until año 2100 para que nunca quede bloqueado.
-- max_members = 2147483647 (INT MAX) para que no tenga límite efectivo.
-- invite_code NULL es válido porque el torneo es public (ver CHECK en 0001).
-- ---------------------------------------------------------------------------

insert into tournaments (
  id,
  name,
  type,
  creator_id,
  invite_code,
  plan_type,
  max_members,
  paid_until
)
values (
  '00000000-0000-0000-0000-000000000001',
  'Ranking Mundial 2026',
  'public',
  null,
  null,
  'paid',
  2147483647,
  '2100-01-01 00:00:00+00'
);

-- ---------------------------------------------------------------------------
-- Función trigger: inscribe automáticamente a cada nuevo usuario en el
-- Ranking Mundial al momento de registrarse.
-- ON CONFLICT DO NOTHING evita errores si por alguna razón ya existe el row.
-- ---------------------------------------------------------------------------

create or replace function add_user_to_ranking_mundial()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into tournament_members (tournament_id, user_id)
  values ('00000000-0000-0000-0000-000000000001', NEW.id)
  on conflict do nothing;
  return NEW;
end;
$$;

create trigger on_auth_user_created_join_ranking_mundial
  after insert on auth.users
  for each row execute function add_user_to_ranking_mundial();


-- ====== SECCIÓN 5: VERIFICACIONES ======
-- Descomentar y ejecutar manualmente en el SQL Editor del Dashboard de Supabase.

-- Verificar que el Ranking Mundial existe con los campos correctos:
-- select id, name, type, plan_type, max_members, paid_until
-- from tournaments
-- where id = '00000000-0000-0000-0000-000000000001';

-- Contar cuántos miembros tiene el Ranking Mundial (debería ser = total de usuarios):
-- select count(*) as total_members
-- from tournament_members
-- where tournament_id = '00000000-0000-0000-0000-000000000001';

-- Verificar las columnas actuales de la tabla tournaments (incluyendo las nuevas):
-- select column_name, data_type, is_nullable, column_default
-- from information_schema.columns
-- where table_schema = 'public'
--   and table_name   = 'tournaments'
-- order by ordinal_position;

-- Verificar que la tabla profiles existe y tiene la estructura correcta:
-- select column_name, data_type, is_nullable
-- from information_schema.columns
-- where table_schema = 'public'
--   and table_name   = 'profiles'
-- order by ordinal_position;
