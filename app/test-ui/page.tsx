"use client"

import * as React from "react"
import { toast } from "sonner"
import { useForm } from "react-hook-form"
import {
  Bell,
  Check,
  LogIn,
  Mail,
  Settings,
  Trash2,
  Trophy,
  User,
} from "lucide-react"

import { Avatar, AvatarFallback, AvatarGroup, AvatarImage } from "@/components/ui/avatar"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Toaster } from "@/components/ui/sonner"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

const partidos = [
  { equipo1: "Argentina", goles1: 3, equipo2: "Francia", goles2: 3, puntos: 6 },
  { equipo1: "Brasil", goles1: 2, equipo2: "Alemania", goles2: 1, puntos: 4 },
  { equipo1: "España", goles1: 1, equipo2: "Inglaterra", goles2: 2, puntos: 3 },
  { equipo1: "Uruguay", goles1: 0, equipo2: "Portugal", goles2: 2, puntos: 0 },
]

export default function TestUI() {
  const form = useForm({
    defaultValues: { email: "", password: "" },
  })

  return (
    <div className="mx-auto max-w-4xl space-y-12 p-8">
      <Toaster />

      <div>
        <h1 className="text-2xl font-bold">shadcn/ui — Componentes base</h1>
        <p className="text-muted-foreground mt-1 text-sm">
          Página de prueba visual. Podés borrarla cuando verifiques que todo está bien.
        </p>
      </div>

      {/* Button */}
      <Section title="Button" description="Variantes y tamaños disponibles">
        <div className="flex flex-wrap gap-2">
          <Button>Default</Button>
          <Button variant="secondary">Secondary</Button>
          <Button variant="outline">Outline</Button>
          <Button variant="ghost">Ghost</Button>
          <Button variant="destructive">Destructive</Button>
          <Button variant="link">Link</Button>
        </div>
        <div className="flex flex-wrap items-center gap-2">
          <Button size="xs">XS</Button>
          <Button size="sm">SM</Button>
          <Button size="default">Default</Button>
          <Button size="lg">LG</Button>
          <Button size="icon"><Bell /></Button>
          <Button disabled>Disabled</Button>
          <Button>
            <Trophy /> Con ícono
          </Button>
        </div>
      </Section>

      {/* Input + Label */}
      <Section title="Input + Label" description="Campo de texto con etiqueta">
        <div className="grid gap-4 sm:grid-cols-2">
          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input id="email" type="email" placeholder="tu@email.com" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="password">Contraseña</Label>
            <Input id="password" type="password" placeholder="••••••••" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="disabled-input">Campo deshabilitado</Label>
            <Input id="disabled-input" disabled value="No editable" />
          </div>
          <div className="space-y-2">
            <Label htmlFor="search">Búsqueda</Label>
            <Input id="search" placeholder="Buscar equipo..." />
          </div>
        </div>
      </Section>

      {/* Card */}
      <Section title="Card" description="Contenedor con header, content y footer">
        <div className="grid gap-4 sm:grid-cols-2">
          <Card>
            <CardHeader>
              <CardTitle>Mi pronóstico</CardTitle>
              <CardDescription>Argentina vs Francia — Final</CardDescription>
            </CardHeader>
            <CardContent>
              <p className="text-3xl font-bold">3 — 3</p>
              <p className="text-muted-foreground mt-1 text-sm">Definición por penales</p>
            </CardContent>
            <CardFooter>
              <span className="text-muted-foreground text-xs">Cierra 18 jul 12:00</span>
            </CardFooter>
          </Card>

          <Card size="sm">
            <CardHeader>
              <CardTitle>Ranking — Grupo A</CardTitle>
              <CardDescription>Card tamaño sm</CardDescription>
            </CardHeader>
            <CardContent>
              <ol className="space-y-1 text-sm">
                <li className="flex justify-between"><span>1. Gonzalo</span><span className="font-mono">48 pts</span></li>
                <li className="flex justify-between"><span>2. Lucía</span><span className="font-mono">41 pts</span></li>
                <li className="flex justify-between"><span>3. Martín</span><span className="font-mono">35 pts</span></li>
              </ol>
            </CardContent>
          </Card>
        </div>
      </Section>

      {/* Form */}
      <Section title="Form" description="Formulario con react-hook-form">
        <Card className="max-w-sm">
          <CardHeader>
            <CardTitle>Ingresar al torneo</CardTitle>
            <CardDescription>Completá tus datos para unirte</CardDescription>
          </CardHeader>
          <CardContent>
            <Form {...form}>
              <form className="space-y-4">
                <FormField
                  control={form.control}
                  name="email"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel>Email</FormLabel>
                      <FormControl>
                        <Input placeholder="tu@email.com" {...field} />
                      </FormControl>
                      <FormDescription>El mismo con el que te registraste</FormDescription>
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
              </form>
            </Form>
          </CardContent>
          <CardFooter>
            <Button className="w-full">
              <LogIn />
              Ingresar
            </Button>
          </CardFooter>
        </Card>
      </Section>

      {/* Dialog */}
      <Section title="Dialog" description="Modal con trigger">
        <div className="flex gap-2">
          <Dialog>
            <DialogTrigger asChild>
              <Button variant="outline">
                <Settings /> Configurar torneo
              </Button>
            </DialogTrigger>
            <DialogContent>
              <DialogHeader>
                <DialogTitle>Configuración del torneo</DialogTitle>
                <DialogDescription>
                  Ajustá el nombre y la visibilidad de tu torneo.
                </DialogDescription>
              </DialogHeader>
              <div className="space-y-4 py-2">
                <div className="space-y-2">
                  <Label>Nombre del torneo</Label>
                  <Input defaultValue="Mundial 2026 — Amigos" />
                </div>
              </div>
              <DialogFooter showCloseButton>
                <Button>
                  <Check /> Guardar cambios
                </Button>
              </DialogFooter>
            </DialogContent>
          </Dialog>

          <Dialog>
            <DialogTrigger asChild>
              <Button variant="destructive">
                <Trash2 /> Eliminar torneo
              </Button>
            </DialogTrigger>
            <DialogContent>
              <DialogHeader>
                <DialogTitle>¿Eliminar torneo?</DialogTitle>
                <DialogDescription>
                  Esta acción es irreversible. Se borrarán todos los pronósticos y el ranking.
                </DialogDescription>
              </DialogHeader>
              <DialogFooter showCloseButton>
                <Button variant="destructive">
                  <Trash2 /> Sí, eliminar
                </Button>
              </DialogFooter>
            </DialogContent>
          </Dialog>
        </div>
      </Section>

      {/* Toast */}
      <Section title="Toast (Sonner)" description="Notificaciones con variantes">
        <div className="flex flex-wrap gap-2">
          <Button variant="outline" onClick={() => toast("Pronóstico guardado")}>
            Default
          </Button>
          <Button variant="outline" onClick={() => toast.success("¡Resultado exacto! +6 pts")}>
            Success
          </Button>
          <Button variant="outline" onClick={() => toast.error("El partido ya cerró")}>
            Error
          </Button>
          <Button variant="outline" onClick={() => toast.warning("Solo quedan 5 minutos")}>
            Warning
          </Button>
          <Button variant="outline" onClick={() => toast.info("Los pronósticos cierran a las 12:00")}>
            Info
          </Button>
        </div>
      </Section>

      {/* Avatar */}
      <Section title="Avatar" description="Foto de perfil con fallback y grupo">
        <div className="flex flex-wrap items-center gap-6">
          <div className="space-y-1 text-center">
            <Avatar size="sm">
              <AvatarImage src="https://github.com/shadcn.png" alt="shadcn" />
              <AvatarFallback>SC</AvatarFallback>
            </Avatar>
            <p className="text-muted-foreground text-xs">sm</p>
          </div>
          <div className="space-y-1 text-center">
            <Avatar>
              <AvatarImage src="https://github.com/shadcn.png" alt="shadcn" />
              <AvatarFallback>SC</AvatarFallback>
            </Avatar>
            <p className="text-muted-foreground text-xs">default</p>
          </div>
          <div className="space-y-1 text-center">
            <Avatar size="lg">
              <AvatarFallback>
                <User className="size-5" />
              </AvatarFallback>
            </Avatar>
            <p className="text-muted-foreground text-xs">lg (fallback)</p>
          </div>
          <div className="space-y-1 text-center">
            <AvatarGroup>
              {["GA", "LM", "PM", "CM"].map((initials) => (
                <Avatar key={initials}>
                  <AvatarFallback>{initials}</AvatarFallback>
                </Avatar>
              ))}
            </AvatarGroup>
            <p className="text-muted-foreground text-xs">grupo</p>
          </div>
        </div>
      </Section>

      {/* Table */}
      <Section title="Table" description="Tabla de pronósticos y puntos">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Partido</TableHead>
              <TableHead className="text-center">Pronóstico</TableHead>
              <TableHead className="text-right">Puntos</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {partidos.map((p) => (
              <TableRow key={`${p.equipo1}-${p.equipo2}`}>
                <TableCell className="font-medium">
                  {p.equipo1} vs {p.equipo2}
                </TableCell>
                <TableCell className="text-center font-mono">
                  {p.goles1} — {p.goles2}
                </TableCell>
                <TableCell className="text-right">
                  <span
                    className={
                      p.puntos === 6
                        ? "font-bold text-green-600"
                        : p.puntos > 0
                        ? "font-medium text-yellow-600"
                        : "text-muted-foreground"
                    }
                  >
                    {p.puntos} pts
                  </span>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </Section>

      {/* Tabs */}
      <Section title="Tabs" description="Navegación entre secciones">
        <Tabs defaultValue="fixture">
          <TabsList>
            <TabsTrigger value="fixture">Fixture</TabsTrigger>
            <TabsTrigger value="ranking">Ranking</TabsTrigger>
            <TabsTrigger value="mis-pronos">Mis pronósticos</TabsTrigger>
          </TabsList>
          <TabsContent value="fixture" className="pt-4">
            <Card size="sm">
              <CardContent className="pt-4">
                <p className="text-muted-foreground text-sm">
                  Acá iría el fixture completo con todos los partidos por fase.
                </p>
              </CardContent>
            </Card>
          </TabsContent>
          <TabsContent value="ranking" className="pt-4">
            <Card size="sm">
              <CardContent className="pt-4">
                <p className="text-muted-foreground text-sm">
                  Acá iría la tabla de posiciones del torneo.
                </p>
              </CardContent>
            </Card>
          </TabsContent>
          <TabsContent value="mis-pronos" className="pt-4">
            <Card size="sm">
              <CardContent className="pt-4">
                <p className="text-muted-foreground text-sm">
                  Acá irían todos los pronósticos del usuario con sus puntos.
                </p>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>
      </Section>

      {/* Inputs extra */}
      <Section title="Input — estados" description="Variantes de estado para validación">
        <div className="grid gap-4 sm:grid-cols-3">
          <div className="space-y-2">
            <Label>Normal</Label>
            <Input placeholder="Escribí algo..." />
          </div>
          <div className="space-y-2">
            <Label>Con ícono (manual)</Label>
            <div className="relative">
              <Mail className="text-muted-foreground absolute top-1/2 left-3 size-4 -translate-y-1/2" />
              <Input className="pl-9" placeholder="tu@email.com" />
            </div>
          </div>
          <div className="space-y-2">
            <Label>Inválido</Label>
            <Input aria-invalid placeholder="Error de validación" />
            <p className="text-destructive text-sm">Campo requerido</p>
          </div>
        </div>
      </Section>
    </div>
  )
}

function Section({
  title,
  description,
  children,
}: {
  title: string
  description: string
  children: React.ReactNode
}) {
  return (
    <section className="space-y-4">
      <div className="border-b pb-2">
        <h2 className="text-lg font-semibold">{title}</h2>
        <p className="text-muted-foreground text-sm">{description}</p>
      </div>
      {children}
    </section>
  )
}
