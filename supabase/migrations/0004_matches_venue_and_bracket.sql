-- =============================================================================
-- 0004_matches_venue_and_bracket.sql
-- Agrega venue, city y bracket_rule a la tabla matches
-- =============================================================================

alter table matches
  add column venue        text,
  add column city         text,
  add column bracket_rule text;

comment on column matches.venue        is 'Nombre del estadio donde se juega el partido (ej: "Estadio Azteca").';
comment on column matches.city         is 'Ciudad donde está el estadio (ej: "Mexico City").';
comment on column matches.bracket_rule is 'Regla de cruce en eliminatorias cuando los equipos aún no están definidos (ej: "Winner Group A vs Runner-up Group B"). NULL en partidos de grupos.';

-- ====== VERIFICACIÓN ======
-- Descomentar y ejecutar en el SQL Editor para confirmar que las columnas se agregaron:

-- select column_name, data_type, is_nullable
-- from information_schema.columns
-- where table_name = 'matches'
-- order by ordinal_position;
