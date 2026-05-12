'use client'

import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { z } from 'zod'
import { toast } from 'sonner'
import type { AuthError } from '@supabase/supabase-js'
import { createClient } from '@/lib/supabase/client'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form'

const schema = z.object({
  name: z.string().min(2, 'Mínimo 2 caracteres'),
  email: z.string().email('Email inválido'),
  password: z.string().min(6, 'Mínimo 6 caracteres'),
})

type FormData = z.infer<typeof schema>

function getErrorMessage(error: AuthError): string {
  switch (error.message) {
    case 'User already registered':
      return 'Ya existe una cuenta con ese email'
    case 'Password should be at least 6 characters':
      return 'La contraseña debe tener al menos 6 caracteres'
    default:
      return 'Ocurrió un error. Intentá de nuevo.'
  }
}

export default function RegisterPage() {
  const router = useRouter()
  const supabase = createClient()
  const [loading, setLoading] = useState(false)
  const [oauthLoading, setOauthLoading] = useState(false)

  const form = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: { name: '', email: '', password: '' },
  })

  async function onSubmit(data: FormData) {
    setLoading(true)
    const { data: authData, error } = await supabase.auth.signUp({
      email: data.email,
      password: data.password,
      options: {
        // El nombre se guarda en user_metadata hasta que exista la tabla profiles
        data: { name: data.name },
      },
    })
    setLoading(false)

    if (error) {
      toast.error(getErrorMessage(error))
      return
    }

    if (authData.session) {
      // Confirmación de email desactivada → sesión inmediata
      toast.success('¡Bienvenido!')
      router.push('/')
      router.refresh()
    } else {
      // Confirmación de email activada (default de Supabase)
      toast.success('¡Registro exitoso! Revisá tu email para confirmar tu cuenta.')
      form.reset()
    }
  }

  async function handleGoogleRegister() {
    setOauthLoading(true)
    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    })
  }

  return (
    <Card className="w-full max-w-sm">
      <CardHeader>
        <CardTitle className="text-2xl">Crear cuenta</CardTitle>
        <CardDescription>Registrate para jugar al prode</CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
            <FormField
              control={form.control}
              name="name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Nombre</FormLabel>
                  <FormControl>
                    <Input placeholder="Tu nombre" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="email"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Email</FormLabel>
                  <FormControl>
                    <Input type="email" placeholder="tu@email.com" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="password"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Contraseña</FormLabel>
                  <FormControl>
                    <Input type="password" placeholder="••••••••" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <Button type="submit" className="w-full" disabled={loading || oauthLoading}>
              {loading ? 'Creando cuenta...' : 'Crear cuenta'}
            </Button>
          </form>
        </Form>

        <div className="relative">
          <div className="absolute inset-0 flex items-center">
            <span className="w-full border-t" />
          </div>
          <div className="relative flex justify-center text-xs uppercase">
            <span className="bg-white px-2 text-muted-foreground">o</span>
          </div>
        </div>

        <Button
          variant="outline"
          className="w-full"
          onClick={handleGoogleRegister}
          disabled={loading || oauthLoading}
        >
          {oauthLoading ? 'Redirigiendo...' : 'Continuar con Google'}
        </Button>

        <p className="text-center text-sm text-muted-foreground">
          ¿Ya tenés cuenta?{' '}
          <Link href="/login" className="font-medium underline underline-offset-4">
            Iniciá sesión
          </Link>
        </p>
      </CardContent>
    </Card>
  )
}
