-- =============================================================================
-- 0001_initial_schema.sql
-- Esquema inicial del Prode Mundial 2026
-- =============================================================================

-- ---------------------------------------------------------------------------
-- Enums
-- ---------------------------------------------------------------------------

create type match_phase as enum (
  'group',
  'round_of_32',
  'round_of_16',
  'quarter',
  'semi',
  'third',
  'final'
);

create type match_status as enum (
  'scheduled',
  'live',
  'finished'
);

create type tournament_type as enum (
  'public',
  'private'
);

-- ---------------------------------------------------------------------------
-- Función auxiliar para updated_at automático
-- ---------------------------------------------------------------------------

create or replace function set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- ---------------------------------------------------------------------------
-- teams
-- Selecciones participantes. group_letter es null para equipos de repechaje
-- que aún no tienen grupo asignado.
-- ---------------------------------------------------------------------------

create table teams (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  fifa_code   char(3) not null,
  flag_url    text,
  group_letter char(1),

  constraint teams_fifa_code_unique unique (fifa_code)
);

comment on table teams is 'Selecciones participantes del Mundial 2026.';

-- ---------------------------------------------------------------------------
-- matches
-- Partidos del torneo. home_team_id / away_team_id son nullable porque en
-- eliminatorias los cruces se definen recién cuando avanzan los equipos.
-- multiplier refleja el multiplicador de puntos según la fase:
--   x1 → group, round_of_32, round_of_16, quarter
--   x2 → semi, third, final
-- ---------------------------------------------------------------------------

create table matches (
  id            uuid primary key default gen_random_uuid(),
  home_team_id  uuid references teams (id) on delete set null,
  away_team_id  uuid references teams (id) on delete set null,
  kickoff_at    timestamptz not null,
  phase         match_phase not null,
  group_letter  char(1),
  home_goals    int,
  away_goals    int,
  status        match_status not null default 'scheduled',
  multiplier    smallint not null default 1,

  constraint matches_multiplier_positive check (multiplier > 0),
  constraint matches_goals_non_negative  check (
    (home_goals is null or home_goals >= 0) and
    (away_goals is null or away_goals >= 0)
  )
);

comment on table matches is 'Partidos del Mundial 2026 con resultado y estado.';
comment on column matches.multiplier is 'x1 para fase de grupos/octavos/cuartos, x2 para semis/3°/final.';

-- ---------------------------------------------------------------------------
-- predictions
-- Pronóstico de un usuario para un partido. Es global: el mismo pronóstico
-- aplica a todos los torneos en los que participa el usuario.
-- Los puntos se calculan y guardan al cierre del partido, no al vuelo.
-- ---------------------------------------------------------------------------

create table predictions (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references auth.users (id) on delete cascade,
  match_id      uuid not null references matches (id) on delete cascade,
  home_goals    int not null,
  away_goals    int not null,
  points_earned int not null default 0,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now(),

  constraint predictions_user_match_unique unique (user_id, match_id),
  constraint predictions_goals_non_negative check (
    home_goals >= 0 and away_goals >= 0
  )
);

comment on table predictions is 'Pronósticos por usuario/partido. Global: vale para todos los torneos del usuario.';
comment on column predictions.points_earned is 'Se calcula y persiste al cerrar el partido, nunca al vuelo.';

-- Trigger para updated_at automático
create trigger predictions_set_updated_at
  before update on predictions
  for each row execute function set_updated_at();

-- ---------------------------------------------------------------------------
-- tournaments
-- Un torneo agrupa usuarios que compiten entre sí. scoring_config guarda las
-- reglas de puntuación como JSON para permitir variantes a futuro.
-- ---------------------------------------------------------------------------

create table tournaments (
  id             uuid primary key default gen_random_uuid(),
  name           text not null,
  type           tournament_type not null default 'private',
  invite_code    text unique,
  creator_id     uuid not null references auth.users (id) on delete restrict,
  scoring_config jsonb not null default '{
    "exact_score":     6,
    "winner_and_diff": 4,
    "winner_or_draw":  3,
    "no_match":        0
  }'::jsonb,
  created_at     timestamptz not null default now(),

  -- Los torneos privados deben tener invite_code
  constraint tournaments_private_needs_code check (
    type = 'public' or invite_code is not null
  )
);

comment on table tournaments is 'Torneos privados o públicos donde los usuarios compiten entre sí.';
comment on column tournaments.scoring_config is 'Reglas de puntaje en JSON. Default: 6/4/3/0.';
comment on column tournaments.invite_code is 'Código de invitación. Obligatorio para torneos privados.';

-- ---------------------------------------------------------------------------
-- tournament_members
-- Relación many-to-many entre torneos y usuarios.
-- ---------------------------------------------------------------------------

create table tournament_members (
  tournament_id uuid not null references tournaments (id) on delete cascade,
  user_id       uuid not null references auth.users (id) on delete cascade,
  joined_at     timestamptz not null default now(),

  primary key (tournament_id, user_id)
);

comment on table tournament_members is 'Participantes de cada torneo.';

-- ---------------------------------------------------------------------------
-- special_predictions (reservado para v2)
-- Predicciones especiales: campeón, goleador, etc.
-- Tabla creada pero sin lógica todavía.
-- ---------------------------------------------------------------------------

create table special_predictions (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references auth.users (id) on delete cascade,
  type          text not null,   -- ej: 'champion', 'top_scorer'
  value         text not null,   -- ej: id del equipo o jugador
  points_earned int not null default 0,
  locked_at     timestamptz      -- null = todavía editable
);

comment on table special_predictions is 'Predicciones especiales (campeón, goleador, etc.). Reservado para v2.';

-- ---------------------------------------------------------------------------
-- Índices
-- ---------------------------------------------------------------------------

-- Pronósticos por partido (para calcular puntos al cerrar un match)
create index idx_predictions_match_id
  on predictions (match_id);

-- Pronósticos por usuario (para la página "mis pronósticos")
create index idx_predictions_user_id
  on predictions (user_id);

-- Miembros de torneo por usuario (para saber en qué torneos está cada uno)
create index idx_tournament_members_user_id
  on tournament_members (user_id);

-- Partidos por fecha de inicio (para ordenar el fixture)
create index idx_matches_kickoff_at
  on matches (kickoff_at);

-- Partidos por estado (para filtrar live / scheduled / finished)
create index idx_matches_status
  on matches (status);
