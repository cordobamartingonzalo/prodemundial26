-- =============================================================================
-- teams.sql
-- Seed: 48 selecciones del Mundial 2026
-- UUIDs fijos: '10000000-0000-0000-0000-00000000XXXX' (0001–0048)
-- Orden: grupos A→L, orden oficial FIFA dentro de cada grupo
-- =============================================================================

insert into teams (id, name, fifa_code, flag_url, group_letter) values

-- ====== GRUPO A ======
('10000000-0000-0000-0000-000000000001', 'México',           'MEX', 'https://flagcdn.com/w320/mx.png',     'A'),
('10000000-0000-0000-0000-000000000002', 'Sudáfrica',        'RSA', 'https://flagcdn.com/w320/za.png',     'A'),
('10000000-0000-0000-0000-000000000003', 'Corea del Sur',    'KOR', 'https://flagcdn.com/w320/kr.png',     'A'),
('10000000-0000-0000-0000-000000000004', 'República Checa',  'CZE', 'https://flagcdn.com/w320/cz.png',     'A'),

-- ====== GRUPO B ======
('10000000-0000-0000-0000-000000000005', 'Canadá',               'CAN', 'https://flagcdn.com/w320/ca.png', 'B'),
('10000000-0000-0000-0000-000000000006', 'Bosnia y Herzegovina', 'BIH', 'https://flagcdn.com/w320/ba.png', 'B'),
('10000000-0000-0000-0000-000000000007', 'Qatar',                'QAT', 'https://flagcdn.com/w320/qa.png', 'B'),
('10000000-0000-0000-0000-000000000008', 'Suiza',                'SUI', 'https://flagcdn.com/w320/ch.png', 'B'),

-- ====== GRUPO C ======
('10000000-0000-0000-0000-000000000009', 'Brasil',   'BRA', 'https://flagcdn.com/w320/br.png',     'C'),
('10000000-0000-0000-0000-000000000010', 'Marruecos','MAR', 'https://flagcdn.com/w320/ma.png',     'C'),
('10000000-0000-0000-0000-000000000011', 'Haití',    'HAI', 'https://flagcdn.com/w320/ht.png',     'C'),
('10000000-0000-0000-0000-000000000012', 'Escocia',  'SCO', 'https://flagcdn.com/w320/gb-sct.png', 'C'),

-- ====== GRUPO D ======
('10000000-0000-0000-0000-000000000013', 'Estados Unidos', 'USA', 'https://flagcdn.com/w320/us.png', 'D'),
('10000000-0000-0000-0000-000000000014', 'Paraguay',       'PAR', 'https://flagcdn.com/w320/py.png', 'D'),
('10000000-0000-0000-0000-000000000015', 'Australia',      'AUS', 'https://flagcdn.com/w320/au.png', 'D'),
('10000000-0000-0000-0000-000000000016', 'Turquía',        'TUR', 'https://flagcdn.com/w320/tr.png', 'D'),

-- ====== GRUPO E ======
('10000000-0000-0000-0000-000000000017', 'Alemania',        'GER', 'https://flagcdn.com/w320/de.png', 'E'),
('10000000-0000-0000-0000-000000000018', 'Curazao',         'CUW', 'https://flagcdn.com/w320/cw.png', 'E'),
('10000000-0000-0000-0000-000000000019', 'Costa de Marfil', 'CIV', 'https://flagcdn.com/w320/ci.png', 'E'),
('10000000-0000-0000-0000-000000000020', 'Ecuador',         'ECU', 'https://flagcdn.com/w320/ec.png', 'E'),

-- ====== GRUPO F ======
('10000000-0000-0000-0000-000000000021', 'Países Bajos', 'NED', 'https://flagcdn.com/w320/nl.png', 'F'),
('10000000-0000-0000-0000-000000000022', 'Japón',        'JPN', 'https://flagcdn.com/w320/jp.png', 'F'),
('10000000-0000-0000-0000-000000000023', 'Suecia',       'SWE', 'https://flagcdn.com/w320/se.png', 'F'),
('10000000-0000-0000-0000-000000000024', 'Túnez',        'TUN', 'https://flagcdn.com/w320/tn.png', 'F'),

-- ====== GRUPO G ======
('10000000-0000-0000-0000-000000000025', 'Bélgica',      'BEL', 'https://flagcdn.com/w320/be.png', 'G'),
('10000000-0000-0000-0000-000000000026', 'Egipto',       'EGY', 'https://flagcdn.com/w320/eg.png', 'G'),
('10000000-0000-0000-0000-000000000027', 'Irán',         'IRN', 'https://flagcdn.com/w320/ir.png', 'G'),
('10000000-0000-0000-0000-000000000028', 'Nueva Zelanda','NZL', 'https://flagcdn.com/w320/nz.png', 'G'),

-- ====== GRUPO H ======
('10000000-0000-0000-0000-000000000029', 'España',         'ESP', 'https://flagcdn.com/w320/es.png', 'H'),
('10000000-0000-0000-0000-000000000030', 'Cabo Verde',     'CPV', 'https://flagcdn.com/w320/cv.png', 'H'),
('10000000-0000-0000-0000-000000000031', 'Arabia Saudita', 'KSA', 'https://flagcdn.com/w320/sa.png', 'H'),
('10000000-0000-0000-0000-000000000032', 'Uruguay',        'URU', 'https://flagcdn.com/w320/uy.png', 'H'),

-- ====== GRUPO I ======
('10000000-0000-0000-0000-000000000033', 'Francia', 'FRA', 'https://flagcdn.com/w320/fr.png', 'I'),
('10000000-0000-0000-0000-000000000034', 'Senegal', 'SEN', 'https://flagcdn.com/w320/sn.png', 'I'),
('10000000-0000-0000-0000-000000000035', 'Irak',    'IRQ', 'https://flagcdn.com/w320/iq.png', 'I'),
('10000000-0000-0000-0000-000000000036', 'Noruega', 'NOR', 'https://flagcdn.com/w320/no.png', 'I'),

-- ====== GRUPO J ======
('10000000-0000-0000-0000-000000000037', 'Argentina', 'ARG', 'https://flagcdn.com/w320/ar.png', 'J'),
('10000000-0000-0000-0000-000000000038', 'Argelia',   'ALG', 'https://flagcdn.com/w320/dz.png', 'J'),
('10000000-0000-0000-0000-000000000039', 'Austria',   'AUT', 'https://flagcdn.com/w320/at.png', 'J'),
('10000000-0000-0000-0000-000000000040', 'Jordania',  'JOR', 'https://flagcdn.com/w320/jo.png', 'J'),

-- ====== GRUPO K ======
('10000000-0000-0000-0000-000000000041', 'Portugal',     'POR', 'https://flagcdn.com/w320/pt.png', 'K'),
('10000000-0000-0000-0000-000000000042', 'RD del Congo', 'COD', 'https://flagcdn.com/w320/cd.png', 'K'),
('10000000-0000-0000-0000-000000000043', 'Uzbekistán',   'UZB', 'https://flagcdn.com/w320/uz.png', 'K'),
('10000000-0000-0000-0000-000000000044', 'Colombia',     'COL', 'https://flagcdn.com/w320/co.png', 'K'),

-- ====== GRUPO L ======
('10000000-0000-0000-0000-000000000045', 'Inglaterra', 'ENG', 'https://flagcdn.com/w320/gb-eng.png', 'L'),
('10000000-0000-0000-0000-000000000046', 'Croacia',    'CRO', 'https://flagcdn.com/w320/hr.png',     'L'),
('10000000-0000-0000-0000-000000000047', 'Ghana',      'GHA', 'https://flagcdn.com/w320/gh.png',     'L'),
('10000000-0000-0000-0000-000000000048', 'Panamá',     'PAN', 'https://flagcdn.com/w320/pa.png',     'L');

-- ====== VERIFICACIÓN ======
-- select group_letter, name, fifa_code from teams order by group_letter, name;
-- Esperado: 48 filas, 4 por grupo (A–L)
