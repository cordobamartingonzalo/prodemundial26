import { createClient } from '@/lib/supabase/server'
import { LogoutButton } from '@/components/logout-button'

export default async function HomePage() {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  // user está garantizado por el layout; el tipo lo fuerza a non-null
  const displayName =
    (user?.user_metadata?.name as string | undefined) ?? user?.email ?? 'usuario'

  return (
    <main className="flex min-h-screen flex-col items-center justify-center gap-4 p-8">
      <h1 className="text-2xl font-semibold">Hola, {displayName} 👋</h1>
      <p className="text-sm text-muted-foreground">{user?.email}</p>
      <LogoutButton />
    </main>
  )
}
