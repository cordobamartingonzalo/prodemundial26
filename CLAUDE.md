# CLAUDE.md — Prode Mundial 2026

App web para jugar al prode con amigos durante el Mundial FIFA 2026.

## Stack

- **Frontend**: Next.js 14+ (App Router) + TypeScript + Tailwind CSS + shadcn/ui
- **Backend**: Supabase (Postgres + Auth + Realtime)
- **Deploy**: Vercel

## Reglas del juego

| Resultado | Puntos |
|---|---|
| Resultado exacto | 6 pts |
| Ganador + diferencia de gol | 4 pts |
| Solo ganador o empate acertado | 3 pts |
| No acertar | 0 pts |

**Multiplicadores por fase:**

| Fase | Multiplicador |
|------|---------------|
| Fase de grupos | x1 |
| 16avos de final | x1 |
| 8avos de final | x2 |
| Cuartos de final | x2 |
| Semifinales | x3 |
| Tercer puesto | x3 |
| Final | x3 |

**Cierre de pronósticos:** editable hasta el horario exacto del partido. Ni un minuto después.

## Manejo de zonas horarias

- La base de datos guarda todos los timestamps en UTC (columna `kickoff_at` es `timestamptz`).
- El público objetivo de la app es argentino, por lo tanto la UI SIEMPRE muestra las fechas y horarios en zona horaria Argentina (UTC-3, sin DST).
- Cuando se muestre un horario en pantalla, agregar siempre el label "(Horario Argentina)" o "(ARG)" para evitar ambigüedad.
- Formato sugerido: "jue 11 jun, 16:00 hs (ARG)".
- Para formateo de fechas en el frontend, usar `date-fns` con locale `es` y timezone forzado a `'America/Argentina/Buenos_Aires'`. Alternativa: `Intl.DateTimeFormat('es-AR', { timeZone: 'America/Argentina/Buenos_Aires' })`.
- Nunca confiar en la timezone del browser del usuario (puede estar en cualquier lado, o mal configurada).

## Decisiones de diseño clave

- **Predictions globales por usuario**: un pronóstico vale para todos los torneos donde el usuario participa.
- **Sistema de puntaje configurable**: guardado como JSON en cada torneo (permite variantes a futuro).
- **Puntos pre-calculados**: se calculan y guardan al cierre del partido, no al vuelo.

## Estructura de carpetas

```
/app
  /(auth)              → login, registro
  /(app)               → app autenticada (layout con nav)
    /fixture           → fixture completo
    /match/[id]        → detalle de partido + carga de pronóstico
    /tournaments
      /[id]            → ranking y detalle del torneo
      /new             → crear torneo
      /join            → unirse a torneo
    /me                → perfil y mis pronósticos
  /api                 → API routes (server-side)
/lib
  /supabase            → cliente de Supabase (server + browser)
  /scoring.ts          → función pura de cálculo de puntos
  /types.ts            → tipos compartidos
/components
  /ui                  → componentes shadcn (no modificar)
  /...                 → componentes propios
/supabase
  /migrations          → migraciones SQL
```

## Comandos comunes

```bash
npm run dev        # arrancar en local (http://localhost:3000)
npm run build      # build de producción
npm run lint       # ESLint
npm run typecheck  # tsc --noEmit (verificar tipos sin compilar)
npm test           # tests con Vitest (cuando lo configuremos)
```

> **Acción manual requerida:** agregar `"typecheck": "tsc --noEmit"` en `package.json` bajo `scripts`.

## Enums y valores fijos del dominio

```typescript
// Estado de un partido
type MatchStatus = 'scheduled' | 'live' | 'finished'

// Fase del torneo
type TournamentPhase =
  | 'group'
  | 'round_of_32'
  | 'round_of_16'
  | 'quarter'
  | 'semi'
  | 'third'
  | 'final'

// Tipo de torneo (visibilidad)
type TournamentType = 'public' | 'private'
```

## Variables de entorno

Crear `.env.local` en la raíz con:

```env
NEXT_PUBLIC_SUPABASE_URL=...
NEXT_PUBLIC_SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
```

- El prefijo `NEXT_PUBLIC_` es **obligatorio** en Next.js para que una variable sea accesible desde el browser. Sin ese prefijo, la variable solo existe en el servidor.
- `SUPABASE_SERVICE_ROLE_KEY` es solo para scripts de administración. **Nunca exponerla al cliente.**

## Migraciones de base de datos

- Ubicación: `/supabase/migrations/`
- Formato de nombre: `NNNN_descripcion.sql` (ej: `0001_initial_schema.sql`)
- Numeración correlativa y sin gaps.
- **Nunca renombrar ni editar una migración ya aplicada.** Cada cambio de esquema = migración nueva.

## Testing

- Tests unitarios **obligatorios** para `/lib/scoring.ts`.
- Tests opcionales pero recomendados para otras utilidades en `/lib`.
- Framework: **Vitest** (se configura cuando llegue el momento).

## Convenciones de código

- **TypeScript estricto.** Prohibido `any`, `as any` y `@ts-ignore` sin un comentario que explique por qué. Si el tipo no está claro, preguntar antes de escapar del tipado.
- **Componentes server por defecto.** Usar `"use client"` solo cuando sea necesario (interactividad, hooks del browser).
- **Mobile-first.** Diseñar para 375px primero, escalar hacia arriba.
- **Funciones puras y testeadas** para toda la lógica de negocio, especialmente el cálculo de puntos.
- **Comentarios en español.**
- **Commits pequeños y descriptivos** siguiendo el formato: `tipo(scope): descripción`
  - Ejemplos: `feat(scoring): agregar multiplicadores`, `fix(match): corregir cierre de pronósticos`

## Cómo trabajamos juntos

1. Antes de codear, confirmar el plan en una o dos líneas.
2. Hacer commits pequeños y descriptivos.
3. Preguntar si hay decisiones ambiguas en lugar de asumir.
4. Avisar cuando una tarea requiera acción manual (variables de entorno, configuración en Supabase, permisos de RLS, etc.).
