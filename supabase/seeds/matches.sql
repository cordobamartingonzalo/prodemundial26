-- =============================================================================
-- matches.sql
-- Seed: 104 partidos del Mundial 2026
-- UUIDs fijos: '20000000-0000-0000-0000-0000000000XX' (01–104)
-- Todos los kickoff_at en UTC. Conversión: UTC = hora_local + |offset|
-- Hora ARG = UTC − 3 (UTC-3, sin DST)
-- Comentario sobre cada INSERT: hora local | UTC | hora ARG
-- =============================================================================


-- ====== GRUPO A ======

-- Match 1 | 11 jun 1pm UTC-6 (19:00 UTC → 16:00 hs ARG) | México vs Sudáfrica | Estadio Azteca, Mexico City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000002',
        '2026-06-11 19:00:00+00', 'group', 'A', 1, 'scheduled', 'Estadio Azteca', 'Mexico City', null);

-- Match 2 | 11 jun 8pm UTC-6 (12 jun 02:00 UTC → 11 jun 23:00 hs ARG) | Corea del Sur vs República Checa | Estadio Akron, Zapopan
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000002',
        '10000000-0000-0000-0000-000000000003',
        '10000000-0000-0000-0000-000000000004',
        '2026-06-12 02:00:00+00', 'group', 'A', 1, 'scheduled', 'Estadio Akron', 'Zapopan', null);

-- Match 25 | 18 jun 12pm UTC-4 (16:00 UTC → 13:00 hs ARG) | República Checa vs Sudáfrica | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000025',
        '10000000-0000-0000-0000-000000000004',
        '10000000-0000-0000-0000-000000000002',
        '2026-06-18 16:00:00+00', 'group', 'A', 1, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta', null);

-- Match 28 | 18 jun 7pm UTC-6 (19 jun 01:00 UTC → 18 jun 22:00 hs ARG) | México vs Corea del Sur | Estadio Akron, Zapopan
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000028',
        '10000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000003',
        '2026-06-19 01:00:00+00', 'group', 'A', 1, 'scheduled', 'Estadio Akron', 'Zapopan', null);

-- Match 53 | 24 jun 7pm UTC-6 (25 jun 01:00 UTC → 24 jun 22:00 hs ARG) | República Checa vs México | Estadio Azteca, Mexico City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000053',
        '10000000-0000-0000-0000-000000000004',
        '10000000-0000-0000-0000-000000000001',
        '2026-06-25 01:00:00+00', 'group', 'A', 1, 'scheduled', 'Estadio Azteca', 'Mexico City', null);

-- Match 54 | 24 jun 7pm UTC-6 (25 jun 01:00 UTC → 24 jun 22:00 hs ARG) | Sudáfrica vs Corea del Sur | Estadio BBVA, Guadalupe
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000054',
        '10000000-0000-0000-0000-000000000002',
        '10000000-0000-0000-0000-000000000003',
        '2026-06-25 01:00:00+00', 'group', 'A', 1, 'scheduled', 'Estadio BBVA', 'Guadalupe', null);


-- ====== GRUPO B ======

-- Match 3 | 12 jun 3pm UTC-4 (19:00 UTC → 16:00 hs ARG) | Canadá vs Bosnia y Herzegovina | BMO Field, Toronto
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000003',
        '10000000-0000-0000-0000-000000000005',
        '10000000-0000-0000-0000-000000000006',
        '2026-06-12 19:00:00+00', 'group', 'B', 1, 'scheduled', 'BMO Field', 'Toronto', null);

-- Match 8 | 13 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Qatar vs Suiza | Levi's Stadium, Santa Clara
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000008',
        '10000000-0000-0000-0000-000000000007',
        '10000000-0000-0000-0000-000000000008',
        '2026-06-13 19:00:00+00', 'group', 'B', 1, 'scheduled', 'Levi''s Stadium', 'Santa Clara', null);

-- Match 26 | 18 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Suiza vs Bosnia y Herzegovina | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000026',
        '10000000-0000-0000-0000-000000000008',
        '10000000-0000-0000-0000-000000000006',
        '2026-06-18 19:00:00+00', 'group', 'B', 1, 'scheduled', 'SoFi Stadium', 'Inglewood', null);

-- Match 27 | 18 jun 3pm UTC-7 (22:00 UTC → 19:00 hs ARG) | Canadá vs Qatar | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000027',
        '10000000-0000-0000-0000-000000000005',
        '10000000-0000-0000-0000-000000000007',
        '2026-06-18 22:00:00+00', 'group', 'B', 1, 'scheduled', 'BC Place', 'Vancouver', null);

-- Match 51 | 24 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Suiza vs Canadá | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000051',
        '10000000-0000-0000-0000-000000000008',
        '10000000-0000-0000-0000-000000000005',
        '2026-06-24 19:00:00+00', 'group', 'B', 1, 'scheduled', 'BC Place', 'Vancouver', null);

-- Match 52 | 24 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Bosnia y Herzegovina vs Qatar | Lumen Field, Seattle
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000052',
        '10000000-0000-0000-0000-000000000006',
        '10000000-0000-0000-0000-000000000007',
        '2026-06-24 19:00:00+00', 'group', 'B', 1, 'scheduled', 'Lumen Field', 'Seattle', null);


-- ====== GRUPO C ======

-- Match 7 | 13 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Brasil vs Marruecos | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000007',
        '10000000-0000-0000-0000-000000000009',
        '10000000-0000-0000-0000-000000000010',
        '2026-06-13 22:00:00+00', 'group', 'C', 1, 'scheduled', 'MetLife Stadium', 'East Rutherford', null);

-- Match 5 | 13 jun 9pm UTC-4 (14 jun 01:00 UTC → 13 jun 22:00 hs ARG) | Haití vs Escocia | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000005',
        '10000000-0000-0000-0000-000000000011',
        '10000000-0000-0000-0000-000000000012',
        '2026-06-14 01:00:00+00', 'group', 'C', 1, 'scheduled', 'Gillette Stadium', 'Foxborough', null);

-- Match 30 | 19 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Escocia vs Marruecos | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000030',
        '10000000-0000-0000-0000-000000000012',
        '10000000-0000-0000-0000-000000000010',
        '2026-06-19 22:00:00+00', 'group', 'C', 1, 'scheduled', 'Gillette Stadium', 'Foxborough', null);

-- Match 29 | 19 jun 8:30pm UTC-4 (20 jun 00:30 UTC → 19 jun 21:30 hs ARG) | Brasil vs Haití | Lincoln Financial Field, Philadelphia
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000029',
        '10000000-0000-0000-0000-000000000009',
        '10000000-0000-0000-0000-000000000011',
        '2026-06-20 00:30:00+00', 'group', 'C', 1, 'scheduled', 'Lincoln Financial Field', 'Philadelphia', null);

-- Match 49 | 24 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Escocia vs Brasil | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000049',
        '10000000-0000-0000-0000-000000000012',
        '10000000-0000-0000-0000-000000000009',
        '2026-06-24 22:00:00+00', 'group', 'C', 1, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens', null);

-- Match 50 | 24 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Marruecos vs Haití | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000050',
        '10000000-0000-0000-0000-000000000010',
        '10000000-0000-0000-0000-000000000011',
        '2026-06-24 22:00:00+00', 'group', 'C', 1, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta', null);


-- ====== GRUPO D ======

-- Match 4 | 12 jun 6pm UTC-7 (13 jun 01:00 UTC → 12 jun 22:00 hs ARG) | Estados Unidos vs Paraguay | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000004',
        '10000000-0000-0000-0000-000000000013',
        '10000000-0000-0000-0000-000000000014',
        '2026-06-13 01:00:00+00', 'group', 'D', 1, 'scheduled', 'SoFi Stadium', 'Inglewood', null);

-- Match 6 | 13 jun 9pm UTC-7 (14 jun 04:00 UTC → 14 jun 01:00 hs ARG) | Australia vs Turquía | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000006',
        '10000000-0000-0000-0000-000000000015',
        '10000000-0000-0000-0000-000000000016',
        '2026-06-14 04:00:00+00', 'group', 'D', 1, 'scheduled', 'BC Place', 'Vancouver', null);

-- Match 32 | 19 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Estados Unidos vs Australia | Lumen Field, Seattle
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000032',
        '10000000-0000-0000-0000-000000000013',
        '10000000-0000-0000-0000-000000000015',
        '2026-06-19 19:00:00+00', 'group', 'D', 1, 'scheduled', 'Lumen Field', 'Seattle', null);

-- Match 31 | 19 jun 8pm UTC-7 (20 jun 03:00 UTC → 20 jun 00:00 hs ARG) | Turquía vs Paraguay | Levi's Stadium, Santa Clara
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000031',
        '10000000-0000-0000-0000-000000000016',
        '10000000-0000-0000-0000-000000000014',
        '2026-06-20 03:00:00+00', 'group', 'D', 1, 'scheduled', 'Levi''s Stadium', 'Santa Clara', null);

-- Match 59 | 25 jun 7pm UTC-7 (26 jun 02:00 UTC → 25 jun 23:00 hs ARG) | Turquía vs Estados Unidos | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000059',
        '10000000-0000-0000-0000-000000000016',
        '10000000-0000-0000-0000-000000000013',
        '2026-06-26 02:00:00+00', 'group', 'D', 1, 'scheduled', 'SoFi Stadium', 'Inglewood', null);

-- Match 60 | 25 jun 7pm UTC-7 (26 jun 02:00 UTC → 25 jun 23:00 hs ARG) | Paraguay vs Australia | Levi's Stadium, Santa Clara
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000060',
        '10000000-0000-0000-0000-000000000014',
        '10000000-0000-0000-0000-000000000015',
        '2026-06-26 02:00:00+00', 'group', 'D', 1, 'scheduled', 'Levi''s Stadium', 'Santa Clara', null);


-- ====== GRUPO E ======

-- Match 10 | 14 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Alemania vs Curazao | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000010',
        '10000000-0000-0000-0000-000000000017',
        '10000000-0000-0000-0000-000000000018',
        '2026-06-14 17:00:00+00', 'group', 'E', 1, 'scheduled', 'NRG Stadium', 'Houston', null);

-- Match 9 | 14 jun 7pm UTC-4 (23:00 UTC → 20:00 hs ARG) | Costa de Marfil vs Ecuador | Lincoln Financial Field, Philadelphia
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000009',
        '10000000-0000-0000-0000-000000000019',
        '10000000-0000-0000-0000-000000000020',
        '2026-06-14 23:00:00+00', 'group', 'E', 1, 'scheduled', 'Lincoln Financial Field', 'Philadelphia', null);

-- Match 33 | 20 jun 4pm UTC-4 (20:00 UTC → 17:00 hs ARG) | Alemania vs Costa de Marfil | BMO Field, Toronto
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000033',
        '10000000-0000-0000-0000-000000000017',
        '10000000-0000-0000-0000-000000000019',
        '2026-06-20 20:00:00+00', 'group', 'E', 1, 'scheduled', 'BMO Field', 'Toronto', null);

-- Match 34 | 20 jun 7pm UTC-5 (21 jun 00:00 UTC → 20 jun 21:00 hs ARG) | Ecuador vs Curazao | Arrowhead Stadium, Kansas City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000034',
        '10000000-0000-0000-0000-000000000020',
        '10000000-0000-0000-0000-000000000018',
        '2026-06-21 00:00:00+00', 'group', 'E', 1, 'scheduled', 'Arrowhead Stadium', 'Kansas City', null);

-- Match 55 | 25 jun 4pm UTC-4 (20:00 UTC → 17:00 hs ARG) | Curazao vs Costa de Marfil | Lincoln Financial Field, Philadelphia
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000055',
        '10000000-0000-0000-0000-000000000018',
        '10000000-0000-0000-0000-000000000019',
        '2026-06-25 20:00:00+00', 'group', 'E', 1, 'scheduled', 'Lincoln Financial Field', 'Philadelphia', null);

-- Match 56 | 25 jun 4pm UTC-4 (20:00 UTC → 17:00 hs ARG) | Ecuador vs Alemania | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000056',
        '10000000-0000-0000-0000-000000000020',
        '10000000-0000-0000-0000-000000000017',
        '2026-06-25 20:00:00+00', 'group', 'E', 1, 'scheduled', 'MetLife Stadium', 'East Rutherford', null);


-- ====== GRUPO F ======

-- Match 11 | 14 jun 3pm UTC-5 (20:00 UTC → 17:00 hs ARG) | Países Bajos vs Japón | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000011',
        '10000000-0000-0000-0000-000000000021',
        '10000000-0000-0000-0000-000000000022',
        '2026-06-14 20:00:00+00', 'group', 'F', 1, 'scheduled', 'AT&T Stadium', 'Arlington', null);

-- Match 12 | 14 jun 8pm UTC-6 (15 jun 02:00 UTC → 14 jun 23:00 hs ARG) | Suecia vs Túnez | Estadio BBVA, Guadalupe
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000012',
        '10000000-0000-0000-0000-000000000023',
        '10000000-0000-0000-0000-000000000024',
        '2026-06-15 02:00:00+00', 'group', 'F', 1, 'scheduled', 'Estadio BBVA', 'Guadalupe', null);

-- Match 35 | 20 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Países Bajos vs Suecia | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000035',
        '10000000-0000-0000-0000-000000000021',
        '10000000-0000-0000-0000-000000000023',
        '2026-06-20 17:00:00+00', 'group', 'F', 1, 'scheduled', 'NRG Stadium', 'Houston', null);

-- Match 36 | 20 jun 10pm UTC-6 (21 jun 04:00 UTC → 21 jun 01:00 hs ARG) | Túnez vs Japón | Estadio BBVA, Guadalupe
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000036',
        '10000000-0000-0000-0000-000000000024',
        '10000000-0000-0000-0000-000000000022',
        '2026-06-21 04:00:00+00', 'group', 'F', 1, 'scheduled', 'Estadio BBVA', 'Guadalupe', null);

-- Match 57 | 25 jun 6pm UTC-5 (23:00 UTC → 20:00 hs ARG) | Japón vs Suecia | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000057',
        '10000000-0000-0000-0000-000000000022',
        '10000000-0000-0000-0000-000000000023',
        '2026-06-25 23:00:00+00', 'group', 'F', 1, 'scheduled', 'AT&T Stadium', 'Arlington', null);

-- Match 58 | 25 jun 6pm UTC-5 (23:00 UTC → 20:00 hs ARG) | Túnez vs Países Bajos | Arrowhead Stadium, Kansas City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000058',
        '10000000-0000-0000-0000-000000000024',
        '10000000-0000-0000-0000-000000000021',
        '2026-06-25 23:00:00+00', 'group', 'F', 1, 'scheduled', 'Arrowhead Stadium', 'Kansas City', null);


-- ====== GRUPO G ======

-- Match 16 | 15 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Bélgica vs Egipto | Lumen Field, Seattle
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000016',
        '10000000-0000-0000-0000-000000000025',
        '10000000-0000-0000-0000-000000000026',
        '2026-06-15 19:00:00+00', 'group', 'G', 1, 'scheduled', 'Lumen Field', 'Seattle', null);

-- Match 15 | 15 jun 6pm UTC-7 (16 jun 01:00 UTC → 15 jun 22:00 hs ARG) | Irán vs Nueva Zelanda | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000015',
        '10000000-0000-0000-0000-000000000027',
        '10000000-0000-0000-0000-000000000028',
        '2026-06-16 01:00:00+00', 'group', 'G', 1, 'scheduled', 'SoFi Stadium', 'Inglewood', null);

-- Match 39 | 21 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Bélgica vs Irán | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000039',
        '10000000-0000-0000-0000-000000000025',
        '10000000-0000-0000-0000-000000000027',
        '2026-06-21 19:00:00+00', 'group', 'G', 1, 'scheduled', 'SoFi Stadium', 'Inglewood', null);

-- Match 40 | 21 jun 6pm UTC-7 (22 jun 01:00 UTC → 21 jun 22:00 hs ARG) | Nueva Zelanda vs Egipto | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000040',
        '10000000-0000-0000-0000-000000000028',
        '10000000-0000-0000-0000-000000000026',
        '2026-06-22 01:00:00+00', 'group', 'G', 1, 'scheduled', 'BC Place', 'Vancouver', null);

-- Match 63 | 26 jun 8pm UTC-7 (27 jun 03:00 UTC → 27 jun 00:00 hs ARG) | Egipto vs Irán | Lumen Field, Seattle
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000063',
        '10000000-0000-0000-0000-000000000026',
        '10000000-0000-0000-0000-000000000027',
        '2026-06-27 03:00:00+00', 'group', 'G', 1, 'scheduled', 'Lumen Field', 'Seattle', null);

-- Match 64 | 26 jun 8pm UTC-7 (27 jun 03:00 UTC → 27 jun 00:00 hs ARG) | Nueva Zelanda vs Bélgica | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000064',
        '10000000-0000-0000-0000-000000000028',
        '10000000-0000-0000-0000-000000000025',
        '2026-06-27 03:00:00+00', 'group', 'G', 1, 'scheduled', 'BC Place', 'Vancouver', null);


-- ====== GRUPO H ======

-- Match 14 | 15 jun 12pm UTC-4 (16:00 UTC → 13:00 hs ARG) | España vs Cabo Verde | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000014',
        '10000000-0000-0000-0000-000000000029',
        '10000000-0000-0000-0000-000000000030',
        '2026-06-15 16:00:00+00', 'group', 'H', 1, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta', null);

-- Match 13 | 15 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Arabia Saudita vs Uruguay | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000013',
        '10000000-0000-0000-0000-000000000031',
        '10000000-0000-0000-0000-000000000032',
        '2026-06-15 22:00:00+00', 'group', 'H', 1, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens', null);

-- Match 38 | 21 jun 12pm UTC-4 (16:00 UTC → 13:00 hs ARG) | España vs Arabia Saudita | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000038',
        '10000000-0000-0000-0000-000000000029',
        '10000000-0000-0000-0000-000000000031',
        '2026-06-21 16:00:00+00', 'group', 'H', 1, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta', null);

-- Match 37 | 21 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Uruguay vs Cabo Verde | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000037',
        '10000000-0000-0000-0000-000000000032',
        '10000000-0000-0000-0000-000000000030',
        '2026-06-21 22:00:00+00', 'group', 'H', 1, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens', null);

-- Match 65 | 26 jun 7pm UTC-5 (27 jun 00:00 UTC → 26 jun 21:00 hs ARG) | Cabo Verde vs Arabia Saudita | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000065',
        '10000000-0000-0000-0000-000000000030',
        '10000000-0000-0000-0000-000000000031',
        '2026-06-27 00:00:00+00', 'group', 'H', 1, 'scheduled', 'NRG Stadium', 'Houston', null);

-- Match 66 | 26 jun 6pm UTC-6 (27 jun 00:00 UTC → 26 jun 21:00 hs ARG) | Uruguay vs España | Estadio Akron, Zapopan
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000066',
        '10000000-0000-0000-0000-000000000032',
        '10000000-0000-0000-0000-000000000029',
        '2026-06-27 00:00:00+00', 'group', 'H', 1, 'scheduled', 'Estadio Akron', 'Zapopan', null);


-- ====== GRUPO I ======

-- Match 17 | 16 jun 3pm UTC-4 (19:00 UTC → 16:00 hs ARG) | Francia vs Senegal | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000017',
        '10000000-0000-0000-0000-000000000033',
        '10000000-0000-0000-0000-000000000034',
        '2026-06-16 19:00:00+00', 'group', 'I', 1, 'scheduled', 'MetLife Stadium', 'East Rutherford', null);

-- Match 18 | 16 jun 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Irak vs Noruega | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000018',
        '10000000-0000-0000-0000-000000000035',
        '10000000-0000-0000-0000-000000000036',
        '2026-06-16 22:00:00+00', 'group', 'I', 1, 'scheduled', 'Gillette Stadium', 'Foxborough', null);

-- Match 42 | 22 jun 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Francia vs Irak | Lincoln Financial Field, Philadelphia
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000042',
        '10000000-0000-0000-0000-000000000033',
        '10000000-0000-0000-0000-000000000035',
        '2026-06-22 21:00:00+00', 'group', 'I', 1, 'scheduled', 'Lincoln Financial Field', 'Philadelphia', null);

-- Match 41 | 22 jun 8pm UTC-4 (23 jun 00:00 UTC → 22 jun 21:00 hs ARG) | Noruega vs Senegal | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000041',
        '10000000-0000-0000-0000-000000000036',
        '10000000-0000-0000-0000-000000000034',
        '2026-06-23 00:00:00+00', 'group', 'I', 1, 'scheduled', 'MetLife Stadium', 'East Rutherford', null);

-- Match 61 | 26 jun 3pm UTC-4 (19:00 UTC → 16:00 hs ARG) | Noruega vs Francia | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000061',
        '10000000-0000-0000-0000-000000000036',
        '10000000-0000-0000-0000-000000000033',
        '2026-06-26 19:00:00+00', 'group', 'I', 1, 'scheduled', 'Gillette Stadium', 'Foxborough', null);

-- Match 62 | 26 jun 3pm UTC-4 (19:00 UTC → 16:00 hs ARG) | Senegal vs Irak | BMO Field, Toronto
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000062',
        '10000000-0000-0000-0000-000000000034',
        '10000000-0000-0000-0000-000000000035',
        '2026-06-26 19:00:00+00', 'group', 'I', 1, 'scheduled', 'BMO Field', 'Toronto', null);


-- ====== GRUPO J ======

-- Match 19 | 16 jun 8pm UTC-5 (17 jun 01:00 UTC → 16 jun 22:00 hs ARG) | Argentina vs Argelia | Arrowhead Stadium, Kansas City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000019',
        '10000000-0000-0000-0000-000000000037',
        '10000000-0000-0000-0000-000000000038',
        '2026-06-17 01:00:00+00', 'group', 'J', 1, 'scheduled', 'Arrowhead Stadium', 'Kansas City', null);

-- Match 20 | 16 jun 9pm UTC-7 (17 jun 04:00 UTC → 17 jun 01:00 hs ARG) | Austria vs Jordania | Levi's Stadium, Santa Clara
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000020',
        '10000000-0000-0000-0000-000000000039',
        '10000000-0000-0000-0000-000000000040',
        '2026-06-17 04:00:00+00', 'group', 'J', 1, 'scheduled', 'Levi''s Stadium', 'Santa Clara', null);

-- Match 43 | 22 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Argentina vs Austria | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000043',
        '10000000-0000-0000-0000-000000000037',
        '10000000-0000-0000-0000-000000000039',
        '2026-06-22 17:00:00+00', 'group', 'J', 1, 'scheduled', 'AT&T Stadium', 'Arlington', null);

-- Match 44 | 22 jun 8pm UTC-7 (23 jun 03:00 UTC → 23 jun 00:00 hs ARG) | Jordania vs Argelia | Levi's Stadium, Santa Clara
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000044',
        '10000000-0000-0000-0000-000000000040',
        '10000000-0000-0000-0000-000000000038',
        '2026-06-23 03:00:00+00', 'group', 'J', 1, 'scheduled', 'Levi''s Stadium', 'Santa Clara', null);

-- Match 69 | 27 jun 9pm UTC-5 (28 jun 02:00 UTC → 27 jun 23:00 hs ARG) | Argelia vs Austria | Arrowhead Stadium, Kansas City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000069',
        '10000000-0000-0000-0000-000000000038',
        '10000000-0000-0000-0000-000000000039',
        '2026-06-28 02:00:00+00', 'group', 'J', 1, 'scheduled', 'Arrowhead Stadium', 'Kansas City', null);

-- Match 70 | 27 jun 9pm UTC-5 (28 jun 02:00 UTC → 27 jun 23:00 hs ARG) | Jordania vs Argentina | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000070',
        '10000000-0000-0000-0000-000000000040',
        '10000000-0000-0000-0000-000000000037',
        '2026-06-28 02:00:00+00', 'group', 'J', 1, 'scheduled', 'AT&T Stadium', 'Arlington', null);


-- ====== GRUPO K ======

-- Match 23 | 17 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Portugal vs RD del Congo | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000023',
        '10000000-0000-0000-0000-000000000041',
        '10000000-0000-0000-0000-000000000042',
        '2026-06-17 17:00:00+00', 'group', 'K', 1, 'scheduled', 'NRG Stadium', 'Houston', null);

-- Match 24 | 17 jun 8pm UTC-6 (18 jun 02:00 UTC → 17 jun 23:00 hs ARG) | Uzbekistán vs Colombia | Estadio Azteca, Mexico City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000024',
        '10000000-0000-0000-0000-000000000043',
        '10000000-0000-0000-0000-000000000044',
        '2026-06-18 02:00:00+00', 'group', 'K', 1, 'scheduled', 'Estadio Azteca', 'Mexico City', null);

-- Match 47 | 23 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Portugal vs Uzbekistán | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000047',
        '10000000-0000-0000-0000-000000000041',
        '10000000-0000-0000-0000-000000000043',
        '2026-06-23 17:00:00+00', 'group', 'K', 1, 'scheduled', 'NRG Stadium', 'Houston', null);

-- Match 48 | 23 jun 8pm UTC-6 (24 jun 02:00 UTC → 23 jun 23:00 hs ARG) | Colombia vs RD del Congo | Estadio Akron, Zapopan
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000048',
        '10000000-0000-0000-0000-000000000044',
        '10000000-0000-0000-0000-000000000042',
        '2026-06-24 02:00:00+00', 'group', 'K', 1, 'scheduled', 'Estadio Akron', 'Zapopan', null);

-- Match 71 | 27 jun 7:30pm UTC-4 (23:30 UTC → 20:30 hs ARG) | Colombia vs Portugal | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000071',
        '10000000-0000-0000-0000-000000000044',
        '10000000-0000-0000-0000-000000000041',
        '2026-06-27 23:30:00+00', 'group', 'K', 1, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens', null);

-- Match 72 | 27 jun 7:30pm UTC-4 (23:30 UTC → 20:30 hs ARG) | RD del Congo vs Uzbekistán | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000072',
        '10000000-0000-0000-0000-000000000042',
        '10000000-0000-0000-0000-000000000043',
        '2026-06-27 23:30:00+00', 'group', 'K', 1, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta', null);


-- ====== GRUPO L ======

-- Match 22 | 17 jun 3pm UTC-5 (20:00 UTC → 17:00 hs ARG) | Inglaterra vs Croacia | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000022',
        '10000000-0000-0000-0000-000000000045',
        '10000000-0000-0000-0000-000000000046',
        '2026-06-17 20:00:00+00', 'group', 'L', 1, 'scheduled', 'AT&T Stadium', 'Arlington', null);

-- Match 21 | 17 jun 7pm UTC-4 (23:00 UTC → 20:00 hs ARG) | Ghana vs Panamá | BMO Field, Toronto
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000021',
        '10000000-0000-0000-0000-000000000047',
        '10000000-0000-0000-0000-000000000048',
        '2026-06-17 23:00:00+00', 'group', 'L', 1, 'scheduled', 'BMO Field', 'Toronto', null);

-- Match 45 | 23 jun 4pm UTC-4 (20:00 UTC → 17:00 hs ARG) | Inglaterra vs Ghana | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000045',
        '10000000-0000-0000-0000-000000000045',
        '10000000-0000-0000-0000-000000000047',
        '2026-06-23 20:00:00+00', 'group', 'L', 1, 'scheduled', 'Gillette Stadium', 'Foxborough', null);

-- Match 46 | 23 jun 7pm UTC-4 (23:00 UTC → 20:00 hs ARG) | Panamá vs Croacia | BMO Field, Toronto
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000046',
        '10000000-0000-0000-0000-000000000048',
        '10000000-0000-0000-0000-000000000046',
        '2026-06-23 23:00:00+00', 'group', 'L', 1, 'scheduled', 'BMO Field', 'Toronto', null);

-- Match 67 | 27 jun 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Panamá vs Inglaterra | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000067',
        '10000000-0000-0000-0000-000000000048',
        '10000000-0000-0000-0000-000000000045',
        '2026-06-27 21:00:00+00', 'group', 'L', 1, 'scheduled', 'MetLife Stadium', 'East Rutherford', null);

-- Match 68 | 27 jun 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Croacia vs Ghana | Lincoln Financial Field, Philadelphia
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000068',
        '10000000-0000-0000-0000-000000000046',
        '10000000-0000-0000-0000-000000000047',
        '2026-06-27 21:00:00+00', 'group', 'L', 1, 'scheduled', 'Lincoln Financial Field', 'Philadelphia', null);


-- ====== 16AVOS DE FINAL (round_of_32, multiplier=1) ======

-- Match 73 | 28 jun 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Runner-up Group A vs Runner-up Group B | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000073',
        null, null,
        '2026-06-28 19:00:00+00', 'round_of_32', null, 1, 'scheduled', 'SoFi Stadium', 'Inglewood',
        'Runner-up Group A vs Runner-up Group B');

-- Match 76 | 29 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Winner Group C vs Runner-up Group F | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000076',
        null, null,
        '2026-06-29 17:00:00+00', 'round_of_32', null, 1, 'scheduled', 'NRG Stadium', 'Houston',
        'Winner Group C vs Runner-up Group F');

-- Match 74 | 29 jun 4:30pm UTC-4 (20:30 UTC → 17:30 hs ARG) | Winner Group E vs 3rd Group A/B/C/D/F | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000074',
        null, null,
        '2026-06-29 20:30:00+00', 'round_of_32', null, 1, 'scheduled', 'Gillette Stadium', 'Foxborough',
        'Winner Group E vs 3rd Group A/B/C/D/F');

-- Match 75 | 29 jun 7pm UTC-6 (30 jun 01:00 UTC → 29 jun 22:00 hs ARG) | Winner Group F vs Runner-up Group C | Estadio BBVA, Guadalupe
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000075',
        null, null,
        '2026-06-30 01:00:00+00', 'round_of_32', null, 1, 'scheduled', 'Estadio BBVA', 'Guadalupe',
        'Winner Group F vs Runner-up Group C');

-- Match 78 | 30 jun 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Runner-up Group E vs Runner-up Group I | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000078',
        null, null,
        '2026-06-30 17:00:00+00', 'round_of_32', null, 1, 'scheduled', 'AT&T Stadium', 'Arlington',
        'Runner-up Group E vs Runner-up Group I');

-- Match 77 | 30 jun 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Winner Group I vs 3rd Group C/D/F/G/H | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000077',
        null, null,
        '2026-06-30 21:00:00+00', 'round_of_32', null, 1, 'scheduled', 'MetLife Stadium', 'East Rutherford',
        'Winner Group I vs 3rd Group C/D/F/G/H');

-- Match 79 | 30 jun 7pm UTC-6 (1 jul 01:00 UTC → 30 jun 22:00 hs ARG) | Winner Group A vs 3rd Group C/E/F/H/I | Estadio Azteca, Mexico City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000079',
        null, null,
        '2026-07-01 01:00:00+00', 'round_of_32', null, 1, 'scheduled', 'Estadio Azteca', 'Mexico City',
        'Winner Group A vs 3rd Group C/E/F/H/I');

-- Match 80 | 1 jul 12pm UTC-4 (16:00 UTC → 13:00 hs ARG) | Winner Group L vs 3rd Group E/H/I/J/K | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000080',
        null, null,
        '2026-07-01 16:00:00+00', 'round_of_32', null, 1, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta',
        'Winner Group L vs 3rd Group E/H/I/J/K');

-- Match 82 | 1 jul 1pm UTC-7 (20:00 UTC → 17:00 hs ARG) | Winner Group G vs 3rd Group A/E/H/I/J | Lumen Field, Seattle
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000082',
        null, null,
        '2026-07-01 20:00:00+00', 'round_of_32', null, 1, 'scheduled', 'Lumen Field', 'Seattle',
        'Winner Group G vs 3rd Group A/E/H/I/J');

-- Match 81 | 1 jul 5pm UTC-7 (2 jul 00:00 UTC → 1 jul 21:00 hs ARG) | Winner Group D vs 3rd Group B/E/F/I/J | Levi's Stadium, Santa Clara
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000081',
        null, null,
        '2026-07-02 00:00:00+00', 'round_of_32', null, 1, 'scheduled', 'Levi''s Stadium', 'Santa Clara',
        'Winner Group D vs 3rd Group B/E/F/I/J');

-- Match 84 | 2 jul 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Winner Group H vs Runner-up Group J | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000084',
        null, null,
        '2026-07-02 19:00:00+00', 'round_of_32', null, 1, 'scheduled', 'SoFi Stadium', 'Inglewood',
        'Winner Group H vs Runner-up Group J');

-- Match 83 | 2 jul 7pm UTC-4 (23:00 UTC → 20:00 hs ARG) | Runner-up Group K vs Runner-up Group L | BMO Field, Toronto
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000083',
        null, null,
        '2026-07-02 23:00:00+00', 'round_of_32', null, 1, 'scheduled', 'BMO Field', 'Toronto',
        'Runner-up Group K vs Runner-up Group L');

-- Match 85 | 2 jul 8pm UTC-7 (3 jul 03:00 UTC → 3 jul 00:00 hs ARG) | Winner Group B vs 3rd Group E/F/G/I/J | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000085',
        null, null,
        '2026-07-03 03:00:00+00', 'round_of_32', null, 1, 'scheduled', 'BC Place', 'Vancouver',
        'Winner Group B vs 3rd Group E/F/G/I/J');

-- Match 88 | 3 jul 1pm UTC-5 (18:00 UTC → 15:00 hs ARG) | Runner-up Group D vs Runner-up Group G | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000088',
        null, null,
        '2026-07-03 18:00:00+00', 'round_of_32', null, 1, 'scheduled', 'AT&T Stadium', 'Arlington',
        'Runner-up Group D vs Runner-up Group G');

-- Match 86 | 3 jul 6pm UTC-4 (22:00 UTC → 19:00 hs ARG) | Winner Group J vs Runner-up Group H | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000086',
        null, null,
        '2026-07-03 22:00:00+00', 'round_of_32', null, 1, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens',
        'Winner Group J vs Runner-up Group H');

-- Match 87 | 3 jul 8:30pm UTC-5 (4 jul 01:30 UTC → 3 jul 22:30 hs ARG) | Winner Group K vs 3rd Group D/E/I/J/L | Arrowhead Stadium, Kansas City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000087',
        null, null,
        '2026-07-04 01:30:00+00', 'round_of_32', null, 1, 'scheduled', 'Arrowhead Stadium', 'Kansas City',
        'Winner Group K vs 3rd Group D/E/I/J/L');


-- ====== 8AVOS DE FINAL (round_of_16, multiplier=2) ======

-- Match 90 | 4 jul 12pm UTC-5 (17:00 UTC → 14:00 hs ARG) | Winner Match 73 vs Winner Match 75 | NRG Stadium, Houston
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000090',
        null, null,
        '2026-07-04 17:00:00+00', 'round_of_16', null, 2, 'scheduled', 'NRG Stadium', 'Houston',
        'Winner Match 73 vs Winner Match 75');

-- Match 89 | 4 jul 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Winner Match 74 vs Winner Match 77 | Lincoln Financial Field, Philadelphia
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000089',
        null, null,
        '2026-07-04 21:00:00+00', 'round_of_16', null, 2, 'scheduled', 'Lincoln Financial Field', 'Philadelphia',
        'Winner Match 74 vs Winner Match 77');

-- Match 91 | 5 jul 4pm UTC-4 (20:00 UTC → 17:00 hs ARG) | Winner Match 76 vs Winner Match 78 | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000091',
        null, null,
        '2026-07-05 20:00:00+00', 'round_of_16', null, 2, 'scheduled', 'MetLife Stadium', 'East Rutherford',
        'Winner Match 76 vs Winner Match 78');

-- Match 92 | 5 jul 6pm UTC-6 (6 jul 00:00 UTC → 5 jul 21:00 hs ARG) | Winner Match 79 vs Winner Match 80 | Estadio Azteca, Mexico City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000092',
        null, null,
        '2026-07-06 00:00:00+00', 'round_of_16', null, 2, 'scheduled', 'Estadio Azteca', 'Mexico City',
        'Winner Match 79 vs Winner Match 80');

-- Match 93 | 6 jul 2pm UTC-5 (19:00 UTC → 16:00 hs ARG) | Winner Match 83 vs Winner Match 84 | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000093',
        null, null,
        '2026-07-06 19:00:00+00', 'round_of_16', null, 2, 'scheduled', 'AT&T Stadium', 'Arlington',
        'Winner Match 83 vs Winner Match 84');

-- Match 94 | 6 jul 5pm UTC-7 (7 jul 00:00 UTC → 6 jul 21:00 hs ARG) | Winner Match 81 vs Winner Match 82 | Lumen Field, Seattle
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000094',
        null, null,
        '2026-07-07 00:00:00+00', 'round_of_16', null, 2, 'scheduled', 'Lumen Field', 'Seattle',
        'Winner Match 81 vs Winner Match 82');

-- Match 95 | 7 jul 12pm UTC-4 (16:00 UTC → 13:00 hs ARG) | Winner Match 86 vs Winner Match 88 | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000095',
        null, null,
        '2026-07-07 16:00:00+00', 'round_of_16', null, 2, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta',
        'Winner Match 86 vs Winner Match 88');

-- Match 96 | 7 jul 1pm UTC-7 (20:00 UTC → 17:00 hs ARG) | Winner Match 85 vs Winner Match 87 | BC Place, Vancouver
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000096',
        null, null,
        '2026-07-07 20:00:00+00', 'round_of_16', null, 2, 'scheduled', 'BC Place', 'Vancouver',
        'Winner Match 85 vs Winner Match 87');


-- ====== CUARTOS DE FINAL (quarter, multiplier=2) ======

-- Match 97 | 9 jul 4pm UTC-4 (20:00 UTC → 17:00 hs ARG) | Winner Match 89 vs Winner Match 90 | Gillette Stadium, Foxborough
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000097',
        null, null,
        '2026-07-09 20:00:00+00', 'quarter', null, 2, 'scheduled', 'Gillette Stadium', 'Foxborough',
        'Winner Match 89 vs Winner Match 90');

-- Match 98 | 10 jul 12pm UTC-7 (19:00 UTC → 16:00 hs ARG) | Winner Match 93 vs Winner Match 94 | SoFi Stadium, Inglewood
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000098',
        null, null,
        '2026-07-10 19:00:00+00', 'quarter', null, 2, 'scheduled', 'SoFi Stadium', 'Inglewood',
        'Winner Match 93 vs Winner Match 94');

-- Match 99 | 11 jul 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Winner Match 91 vs Winner Match 92 | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000099',
        null, null,
        '2026-07-11 21:00:00+00', 'quarter', null, 2, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens',
        'Winner Match 91 vs Winner Match 92');

-- Match 100 | 11 jul 8pm UTC-5 (12 jul 01:00 UTC → 11 jul 22:00 hs ARG) | Winner Match 95 vs Winner Match 96 | Arrowhead Stadium, Kansas City
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000100',
        null, null,
        '2026-07-12 01:00:00+00', 'quarter', null, 2, 'scheduled', 'Arrowhead Stadium', 'Kansas City',
        'Winner Match 95 vs Winner Match 96');


-- ====== SEMIFINALES (semi, multiplier=3) ======

-- Match 101 | 14 jul 2pm UTC-5 (19:00 UTC → 16:00 hs ARG) | Winner Match 97 vs Winner Match 98 | AT&T Stadium, Arlington
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000101',
        null, null,
        '2026-07-14 19:00:00+00', 'semi', null, 3, 'scheduled', 'AT&T Stadium', 'Arlington',
        'Winner Match 97 vs Winner Match 98');

-- Match 102 | 15 jul 3pm UTC-4 (19:00 UTC → 16:00 hs ARG) | Winner Match 99 vs Winner Match 100 | Mercedes-Benz Stadium, Atlanta
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000102',
        null, null,
        '2026-07-15 19:00:00+00', 'semi', null, 3, 'scheduled', 'Mercedes-Benz Stadium', 'Atlanta',
        'Winner Match 99 vs Winner Match 100');


-- ====== TERCER PUESTO (third, multiplier=3) ======

-- Match 103 | 18 jul 5pm UTC-4 (21:00 UTC → 18:00 hs ARG) | Loser Match 101 vs Loser Match 102 | Hard Rock Stadium, Miami Gardens
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000103',
        null, null,
        '2026-07-18 21:00:00+00', 'third', null, 3, 'scheduled', 'Hard Rock Stadium', 'Miami Gardens',
        'Loser Match 101 vs Loser Match 102');


-- ====== FINAL (final, multiplier=3) ======

-- Match 104 | 19 jul 3pm UTC-4 (19:00 UTC → 16:00 hs ARG) | Winner Match 101 vs Winner Match 102 | MetLife Stadium, East Rutherford
insert into matches (id, home_team_id, away_team_id, kickoff_at, phase, group_letter, multiplier, status, venue, city, bracket_rule)
values ('20000000-0000-0000-0000-000000000104',
        null, null,
        '2026-07-19 19:00:00+00', 'final', null, 3, 'scheduled', 'MetLife Stadium', 'East Rutherford',
        'Winner Match 101 vs Winner Match 102');


-- ====== VERIFICACIONES ======
-- Descomentar y ejecutar en el SQL Editor del Dashboard de Supabase.

-- Conteo total esperado: 104
-- select count(*) from matches;

-- Distribución por fase esperada:
--   group: 72, round_of_32: 16, round_of_16: 8, quarter: 4, semi: 2, third: 1, final: 1
-- select phase, count(*) from matches group by phase order by phase;

-- Primer partido del Mundial (México vs Sudáfrica):
-- select m.kickoff_at at time zone 'America/Argentina/Buenos_Aires' as hora_arg,
--        h.name as local, a.name as visitante, m.venue, m.city
-- from matches m
-- left join teams h on h.id = m.home_team_id
-- left join teams a on a.id = m.away_team_id
-- order by kickoff_at asc limit 1;

-- Partidos de eliminatorias con su regla de cruce:
-- select phase, kickoff_at at time zone 'America/Argentina/Buenos_Aires' as hora_arg,
--        bracket_rule, venue
-- from matches where phase != 'group' order by kickoff_at;
