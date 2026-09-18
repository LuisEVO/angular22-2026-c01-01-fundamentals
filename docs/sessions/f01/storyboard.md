# F01 Slide Storyboard v3

**Course:** Angular 22 Fundamentos  
**Session:** F01 — Introducción a Angular 22 y primeros componentes  
**Project:** EventHub  
**Status:** Propuesta para aprobación antes de modificar el PPT  
**Estimated deck size:** 37 slides  
**Class duration:** 180 minutos

---

# 1. Ajustes incorporados en v3

Esta versión incorpora dos principios adicionales para todo el curso:

1. El repaso de TypeScript debe cubrir con claridad los tipos básicos que el alumno utilizará de inmediato: `string`, `number` y `boolean`, además de inferencia, interfaces, unions, generics y modificadores relevantes.
2. Cada feature de Angular debe comenzar con una explicación conceptual en lenguaje sencillo y un gráfico antes de presentar APIs o sintaxis.

## Regla pedagógica para introducir features

Antes de mostrar código, toda feature importante seguirá, cuando corresponda, esta secuencia:

```text
1. ¿Qué es?
2. ¿Qué problema resuelve?
3. ¿Cómo se representa mentalmente?
4. ¿Cómo funciona en Angular?
5. ¿Cómo se escribe?
6. ¿Dónde aparece en EventHub?
```

Ejemplo para componentes:

```text
"Un componente es uno de los bloques de construcción
fundamentales de una interfaz."

        ↓

┌───────────────┐
│   Header      │
├───────────────┤
│ Event card    │
├───────────────┤
│ Event list    │
└───────────────┘
```

La API `@Component()` aparece recién después de construir ese significado.

Esta misma regla se reutilizará posteriormente con Signals, Services, Router, Forms, HTTP, Interceptors y otras features.

---

# 2. Distribución temporal

| Bloque | Tiempo |
|---|---:|
| Apertura y modelo mental de Angular | 15 min |
| Workspace, bootstrap y baseline | 15 min |
| Repaso TypeScript | 25 min |
| Componentes Angular | 25 min |
| EventHub: modelo, estado e interpolación | 15 min |
| Pausa | 10 min |
| Cómo llegamos a Angular 22 | 20 min |
| Demo del instructor | 10 min |
| Práctica guiada | 10 min |
| Laboratorio independiente | 30 min |
| Cierre | 5 min |
| **Total** | **180 min** |

> Ajuste operativo: el storyboard contiene material suficiente para una cohorte lenta o rápida. El laboratorio dispone de una guía completa y puede extenderse hasta ~40 minutos si el ritmo del grupo lo permite, recortando recap o explicación secundaria sin perder los objetivos obligatorios.

---

# 3. Storyboard slide por slide

## Bloque A — Entrar a Angular sin asumir experiencia previa

### Slide 01 — Portada

**Título:** Angular 22 Fundamentos  
**Subtítulo:** F01 · Introducción a Angular 22 y primeros componentes

**Propósito:** establecer identidad del curso y presentar EventHub como proyecto progresivo.

**Visual:** branding EventHub + preview pequeño del featured event.

---

### Slide 02 — ¿Qué construiremos durante el nivel?

**Propósito:** mostrar el destino antes de explicar APIs.

```text
F01  Primer componente
 ↓
F02  Catálogo
 ↓
F03  Composición
 ↓
F04  Estado + services
 ↓
F05  Navegación
 ↓
F06  Formularios
 ↓
F07  API
 ↓
F08  Producción
```

**Visual:** timeline horizontal de EventHub.

---

### Slide 03 — Objetivos de F01

Al finalizar podrás:

- explicar qué papel cumple Angular en una aplicación frontend;
- reconocer cómo arranca una aplicación Angular;
- leer TypeScript básico utilizado por el proyecto;
- crear y utilizar un componente standalone;
- modelar datos mediante una interfaz;
- mostrar estado del componente mediante interpolación.

---

### Slide 04 — ¿Qué es Angular?

**Definición sencilla:**

> Angular es un framework para construir aplicaciones web organizadas a partir de componentes y un conjunto integrado de herramientas.

**Pregunta de apertura:** ¿qué trabajo dejaríamos de resolver manualmente si usamos un framework?

**Visual:**

```text
Aplicación web
      │
      ├── Components
      ├── Templates
      ├── Routing
      ├── Forms
      ├── HTTP
      ├── Dependency Injection
      └── Tooling
```

**Mensaje clave:** no aprenderemos APIs aisladas; cada herramienta aparecerá cuando EventHub tenga un problema que resolver.

---

### Slide 05 — Del navegador a una aplicación Angular

**Visual:**

```text
Browser
   ↓
index.html
   ↓
main.ts
   ↓
Angular bootstrap
   ↓
App
   ↓
component tree
```

**Mensaje clave:** Angular se ejecuta dentro del navegador y monta una aplicación a partir de un componente raíz.

---

## Bloque B — Cómo nace el workspace

### Slide 06 — ¿Cómo arranca EventHub?

**Código real:** `src/main.ts` de `f01-start`.

```ts
bootstrapApplication(App, appConfig)
  .catch((err) => console.error(err));
```

**Visual:**

```text
main.ts
 ├── App
 └── appConfig
      ↓
bootstrapApplication()
      ↓
Angular application
```

---

### Slide 07 — Anatomía mínima del workspace

**Visual:** estructura real de `f01-start`.

```text
src/
├── app/
│   ├── app.ts
│   ├── app.html
│   ├── app.css
│   └── app.config.ts
├── main.ts
└── styles.css

public/
package.json
angular.json
tsconfig.json
```

**Mensaje clave:** distinguir application code, assets y configuración.

---

### Slide 08 — Baseline certificado del curso

```text
Angular 22.1.7
Angular CLI 22.1.8
Node 24.16.0
TypeScript 6.0.3
npm 11.13.0
```

**Concepto visual:**

```text
package.json
+
package-lock.json
+
.nvmrc
+
npm ci
```

**Mensaje clave:** toda la clase trabaja sobre la misma línea base reproducible.

---

# Bloque C — TypeScript necesario para leer Angular

### Slide 09 — ¿Por qué Angular utiliza TypeScript?

**Definición sencilla:**

> TypeScript es un lenguaje que extiende JavaScript con sintaxis para tipos y análisis estático.

**Visual:**

```text
TypeScript source
       ↓
type checking
       ↓
JavaScript
       ↓
Browser / Node.js
```

**Mensaje clave:** TypeScript agrega información de tipos y análisis durante el desarrollo, pero el código que finalmente se ejecuta es JavaScript.

---

### Slide 10 — Tipos básicos: `string`, `number`, `boolean`

**Objetivo:** asegurar una base explícita antes de introducir modelos.

```ts
let title: string = 'Angular Summit Lima';
let availableSpots: number = 50;
let isFeatured: boolean = true;
```

**Visual:**

```text
'Angular Summit Lima'  → string
50                     → number
true                   → boolean
```

**Explicación:**

- `string`: texto;
- `number`: valores numéricos;
- `boolean`: `true` o `false`.

**Pequeño contraste:**

```ts
availableSpots = '50'; // ❌ string no es number
```

**Mensaje clave:** el tipo describe qué clase de valor puede almacenar una variable.

---

### Slide 11 — Inferencia: TypeScript puede deducir el tipo

**Ejemplo:**

```ts
const title = 'Angular Summit Lima';
const availableSpots = 50;
const isFeatured = true;
```

TypeScript infiere:

```text
title          → string
availableSpots → number
isFeatured     → boolean
```

**Comparación:**

```ts
let location: string = 'Lima';  // anotación explícita

const city = 'Lima';            // inferencia
```

**Mensaje clave:** no es necesario escribir el tipo cuando TypeScript ya puede deducirlo con claridad.

---

### Slide 12 — Interfaces: describir la forma de los datos

**Definición sencilla:**

> Una interface describe qué propiedades debe tener un objeto y qué tipo tiene cada una.

```ts
interface EventModel {
  title: string;
  date: string;
  location: string;
}
```

**Visual:**

```text
EventModel
"forma esperada"
      ↓ valida
┌───────────────────────────┐
│ title: string             │
│ date: string              │
│ location: string          │
└───────────────────────────┘
```

**Ejemplo incorrecto:**

```ts
const event: EventModel = {
  title: 'Angular Summit Lima',
  // faltan date y location
};
```

---

### Slide 13 — Unions: más de un valor permitido

**Definición sencilla:**

> Una union permite indicar varias alternativas válidas para un mismo dato.

```ts
type EventCategory =
  | 'technology'
  | 'business'
  | 'design'
  | 'community';
```

```ts
category = 'technology'; // ✅
category = 'sports';     // ❌
```

**Reconocimiento adicional:**

```ts
string | null
```

**Nota:** `EventCategory` se implementará realmente en F02.

---

### Slide 14 — Generics: tipos reutilizables sin perder información

**Definición sencilla:**

> Un generic permite escribir código que trabaja con distintos tipos sin convertirlos en `any`.

**Problema:**

```ts
function first(items: any[]) {
  return items[0];
}
```

**Mejora:**

```ts
function first<T>(items: T[]): T | undefined {
  return items[0];
}
```

**Visual:**

```text
EventModel[]
     ↓
  first<T>
     ↓
EventModel | undefined
```

**Conexión futura:**

```text
input<EventModel>()
Observable<EventModel[]>()
httpResource<EventModel[]>()
```

---

### Slide 15 — `readonly`, `protected` y visibilidad

**Código que aparecerá durante F01:**

```ts
protected readonly featuredEvent: EventModel = { ... };
```

**Definición sencilla:**

```text
protected
→ disponible para la clase y su template

readonly
→ esta referencia no se reasigna
```

**Reconocimiento breve:**

```text
public
protected
private
```

**No profundizar:** herencia u otros detalles avanzados del sistema de acceso.

---

## Bloque D — El concepto central de F01: componentes

### Slide 16 — ¿Qué es un componente?

**Definición sencilla principal:**

> Un componente es uno de los bloques de construcción fundamentales de una interfaz.

**Visual principal:**

```text
┌───────────────────────────────────┐
│ Header component                  │
├───────────────────────────────────┤
│                                   │
│ Event card component              │
│                                   │
├───────────────────────────────────┤
│ Footer component                  │
└───────────────────────────────────┘
```

**Otra forma de decirlo:**

> Cada componente representa una parte de la interfaz con una responsabilidad concreta.

**Mensaje clave:** primero pensamos en piezas de interfaz; luego veremos cómo Angular representa técnicamente esas piezas.

---

### Slide 17 — ¿Qué problema resuelve un componente?

**Sin componentes:**

```text
Una página grande
HTML + comportamiento + estilos
cada vez más difíciles de mantener
```

**Con componentes:**

```text
App
├── Header
├── EventList
│   └── EventCard
└── Footer
```

**Mensaje clave:** componentes permiten separar responsabilidades y componer interfaces grandes usando piezas más pequeñas.

---

### Slide 18 — ¿Cómo representa Angular un componente?

**Ahora sí aparece la API.**

```ts
@Component({
  selector: 'app-header',
  imports: [],
  templateUrl: './header.html',
  styleUrl: './header.css',
})
export class Header {}
```

**Visual con etiquetas:**

```text
@Component
   │
   ├── selector     → nombre usado en HTML
   ├── imports      → dependencias del template
   ├── templateUrl  → estructura
   └── styleUrl     → presentación

Header class
   └── estado + comportamiento
```

---

### Slide 19 — Clase, template y estilos trabajan juntos

**Visual:**

```text
Header class
     │
     ├── state / behavior
     │
     ▼
header.html
     │
     └── UI

header.css
     └── presentation
```

**Mensaje clave:** un componente Angular no es únicamente una clase TypeScript.

---

### Slide 20 — Composición: construir una interfaz con componentes

**Definición sencilla:**

> Componer significa construir un componente utilizando otros componentes.

**Código:**

```ts
@Component({
  imports: [Header],
})
export class App {}
```

```html
<app-header />
```

**Visual:**

```text
App
 │
 ├── Header
 │
 └── Featured event
```

---

### Slide 21 — Angular CLI crea la estructura repetitiva

```bash
ng generate component layout/header --skip-tests
```

**Visual:**

```text
CLI command
    ↓
header.ts
header.html
header.css
```

**Mensaje clave:** el CLI automatiza scaffolding, pero debemos entender el código generado.

---

## Bloque E — Aplicar los conceptos a EventHub

### Slide 22 — EventModel: nuestro primer modelo

```ts
export interface EventModel {
  title: string;
  description: string;
  date: string;
  location: string;
  imageUrl: string;
}
```

**Definición sencilla:**

> `EventModel` describe cómo se ve un evento para esta primera versión de EventHub.

**Mensaje clave:** es intencionalmente parcial.

---

### Slide 23 — Estado del componente con type safety

```ts
protected readonly featuredEvent: EventModel = {
  title: 'Angular Summit Lima',
  ...
};
```

**Visual:**

```text
EventModel
    ↓ checks
featuredEvent
```

**Pregunta:** ¿qué sucede si eliminamos `location`?

---

### Slide 24 — ¿Qué es interpolación?

**Definición sencilla:**

> Interpolación permite insertar el valor de una expresión del componente dentro del HTML.

```html
<h1>
  {{ featuredEvent.title }}
</h1>
```

**También en F01:**

```html
src="{{ featuredEvent.imageUrl }}"
```

**Callout:** Property binding llega en F02.

---

### Slide 25 — Estado → template → UI

```text
App class
featuredEvent.title
       ↓
{{ featuredEvent.title }}
       ↓
Angular Summit Lima
```

**Mini demo conceptual:** cambiar el título y observar el resultado.

---

### Slide 26 — EventHub al terminar F01

```text
App
├── Header
└── featuredEvent
       ↓
     template
```

```text
app/
├── app.ts
├── app.html
├── events/
│   └── event-model.ts
└── layout/
    └── header/
```

---

## Bloque F — Cómo llegamos a Angular 22

### Slide 27 — Cómo llegamos a Angular 22

**Visual:**

```text
Angular tradicional
        ↓
Standalone
        ↓
Zoneless
        ↓
OnPush default
        ↓
Angular 22
```

**Mensaje clave:** ahora que conocemos componentes y bootstrap, podemos entender por qué Angular 22 se ve distinto a versiones históricas.

---

### Slide 28 — Standalone: menos intermediación de NgModule

**Badge:** `DEFAULT SINCE v19`

**Definición sencilla:**

> Un componente standalone puede declarar directamente las dependencias que necesita sin depender de un NgModule para ser declarado.

**Antes:**

```ts
@NgModule({
  declarations: [HeaderComponent]
})
export class AppModule {}
```

**Actual:**

```ts
@Component({
  imports: [Header]
})
export class App {}
```

**Mensaje importante:** NgModule sigue existiendo y aparece frecuentemente en proyectos anteriores.

---

### Slide 29 — Zoneless: Angular ya no depende de Zone.js por defecto

**Badge:** `DEFAULT SINCE v21`

**Definición sencilla:**

> Zoneless significa que Angular ya no necesita Zone.js como mecanismo general para enterarse de que la interfaz podría necesitar actualizarse.

**Visual tradicional:**

```text
click / timer / HTTP
       ↓
    Zone.js
       ↓
Angular es notificado
       ↓
UI synchronization
```

**Visual moderno simplificado:**

```text
Angular APIs / notifications
          ↓
Angular sabe cuándo sincronizar
          ↓
UI
```

---

### Slide 30 — OnPush: nuevo default de componentes

**Badge:** `DEFAULT SINCE v22`

**Definición sencilla:**

> OnPush permite que Angular sea más selectivo sobre qué partes del árbol de componentes necesita revisar.

**Distinción:**

```text
Zoneless
¿Cuándo hay que sincronizar?

OnPush
¿Qué parte del árbol necesita revisión?
```

**No profundizar:** triggers completos de OnPush.

---

### Slide 31 — Naming moderno del Style Guide

**Badge:** `STYLE GUIDE SHIFT: v19 → v20`

**Guía v19:**

```text
hero-list.component.ts
user-profile.service.ts
```

**Guía v20+:**

```text
hero-list.ts
user-profile-service.ts
```

**Mensaje clave:** la convención anterior sigue siendo común en proyectos existentes.

---

## Bloque G — Convertir teoría en práctica

### Slide 32 — Demo del instructor

```text
f01-start
   ↓
generate Header
   ↓
create EventModel
   ↓
create featuredEvent
   ↓
render with interpolation
```

---

### Slide 33 — Práctica guiada: rompe el contrato

Eliminar temporalmente `location` de `featuredEvent`.

**Preguntas:**
- ¿qué reporta TypeScript?;
- ¿por qué ocurre antes de ejecutar la aplicación?

Después restaurar la propiedad.

---

### Slide 34 — Laboratorio F01

```text
f01-start
    ↓
primera versión funcional de EventHub
```

**Tareas:**
1. Header
2. EventModel
3. featuredEvent
4. interpolation
5. build

---

### Slide 35 — Resultado esperado

```text
Header       ✅
Logo         ✅
Featured     ✅
Local asset  ✅
Dynamic data ✅
```

**Visual:** EventHub F01 terminado.

---

### Slide 36 — Errores frecuentes

```text
'app-header' is not known
→ ¿Header está en imports?

imagen rota
→ revisar ruta en public/

objeto no cumple EventModel
→ revisar propiedades/tipos

template no encuentra estado
→ revisar clase y template asociados
```

---

## Bloque H — Cierre

### Slide 37 — Recap + problema para F02

**Recap:**

```text
Angular app
TypeScript
Component
Composition
Model
Interpolation
```

**Problema abierto:**

```text
featuredEvent
      ↓
solo un evento

¿Qué pasa cuando EventHub necesita muchos?
```

**Bridge:** F02 — Templates, bindings y control flow.

---

# 4. Regla reusable para futuras sesiones

Esta regla queda propuesta como estándar del curso:

## Antes de una API, primero significado

Ejemplos futuros:

### Signal

> Un Signal es un valor reactivo cuyo cambio Angular puede rastrear.

```text
value changes
     ↓
Angular knows
     ↓
UI reacts
```

### Service

> Un Service es un lugar reutilizable para concentrar lógica o datos que no pertenecen a un componente concreto.

### Router
