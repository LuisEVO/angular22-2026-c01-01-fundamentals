# Guía de laboratorio F01 — Primeros pasos con Angular 22 y componentes

**Curso:** Angular 22 Fundamentos  
**Sesión:** F01 — Introducción a Angular 22 y primeros componentes  
**Proyecto:** EventHub  
**Tiempo estimado de laboratorio:** 40 minutos  
**Checkpoint inicial:** `f01-start`  
**Checkpoint esperado:** `f01-solution`

---

## 1. Objetivo del laboratorio

En este laboratorio convertirás el workspace inicial de Angular en la primera versión funcional de EventHub.

Al finalizar habrás:

- creado el primer componente reutilizable de la aplicación;
- definido una interfaz TypeScript sencilla para modelar un evento;
- creado un evento destacado dentro del componente raíz;
- mostrado valores dinámicos en el template mediante interpolación;
- compuesto el componente `Header` dentro de `App`;
- mantenido la aplicación dentro del alcance de F01, sin Router, Signals, Services, Forms ni HTTP.

---

## 2. Prerrequisitos

Antes de comenzar, verifica que tienes:

- Node.js 24 instalado;
- npm disponible;
- el proyecto inicial correspondiente a `f01-start`;
- un editor de código;
- una terminal abierta en la raíz del proyecto.

La versión de Node certificada para el curso se encuentra en `.nvmrc`.

```bash
node --version
npm --version
```

---

## 3. Preparar el proyecto

Instala exactamente las dependencias registradas en el lockfile:

```bash
npm ci
```

Inicia el servidor de desarrollo:

```bash
npm start
```

Abre:

```text
http://localhost:4200/
```

En este punto la aplicación debe iniciar correctamente, pero todavía no debe contener las funcionalidades de EventHub que desarrollarás en este laboratorio.

### Checkpoint

Antes de continuar confirma que:

- el proyecto compila;
- la aplicación carga en el navegador;
- no existen errores en la terminal ni en la consola del navegador.

---

## 4. Tarea 1 — Crear el componente Header

Genera el primer componente reutilizable:

```bash
ng generate component layout/header --skip-tests
```

Angular debe crear:

```text
src/app/layout/header/
├── header.ts
├── header.html
└── header.css
```

### 4.1 Template del Header

Actualiza `src/app/layout/header/header.html`:

```html
<header class="site-header">
  <div class="site-header__brand">
    <img src="images/logo.svg" width="36" height="36" alt="" />
    <span>EventHub</span>
  </div>

  <p class="site-header__tagline">
    Eventos para aprender y conectar
  </p>
</header>
```

### 4.2 Estilos del Header

El objetivo del laboratorio es Angular, no CSS. Utiliza los siguientes estilos proporcionados:

```css
:host {
  display: block;
}

.site-header {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  gap: 0.75rem 1.5rem;
  padding: 1rem 1.5rem;
  background: var(--eh-surface);
  border-bottom: 1px solid var(--eh-line);
}

.site-header__brand {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-size: 1.15rem;
  font-weight: 700;
  letter-spacing: 0.02em;
}

.site-header__brand img {
  width: 36px;
  height: 36px;
  border-radius: 10px;
}

.site-header__tagline {
  color: var(--eh-muted);
  font-size: 0.95rem;
}
```

### Checkpoint

Confirma que:

- `Header` existe como un componente Angular independiente;
- su selector es `app-header`;
- no has agregado Router ni otras funcionalidades adicionales.

---

## 5. Tarea 2 — Crear el primer modelo de EventHub

Crea:

```text
src/app/events/event-model.ts
```

Define la primera versión de `EventModel`.

En F01 el modelo solo necesita la información utilizada por el evento destacado:

```ts
export interface EventModel {
  title: string;
  description: string;
  date: string;
  location: string;
  imageUrl: string;
}
```

Este es intencionalmente un modelo parcial. En las siguientes sesiones aparecerán nuevas propiedades cuando la aplicación realmente las necesite.

### Checkpoint

`EventModel` debe:

- estar exportado;
- contener exactamente las propiedades necesarias para el evento destacado de F01;
- utilizar `string` en sus cinco propiedades;
- no incluir todavía `id`, categorías, cupos disponibles ni un indicador de evento destacado.

---

## 6. Tarea 3 — Crear un evento destacado en App

Abre:

```text
src/app/app.ts
```

Importa:

```ts
import { EventModel } from './events/event-model';
import { Header } from './layout/header/header';
```

Registra la dependencia del componente:

```ts
imports: [Header],
```

Dentro de `App`, crea:

```ts
protected readonly featuredEvent: EventModel = {
  title: 'Angular Summit Lima',
  description:
    'Una jornada presencial para explorar Angular moderno, arquitectura frontend y la comunidad que se está formando en Lima.',
  date: '2026-11-12',
  location: 'Lima, Perú',
  imageUrl: 'images/events/angular-summit-lima.svg',
};
```

### Qué debes observar

`featuredEvent` está tipado explícitamente como `EventModel`.

Si falta una propiedad requerida o utilizas un tipo incompatible, TypeScript debe reportar el problema.

### Checkpoint

Confirma que:

- `Header` aparece en `imports`;
- `featuredEvent` está tipado como `EventModel`;
- la imagen utiliza el asset local incluido en el proyecto inicial.

---

## 7. Tarea 4 — Mostrar el Header y el evento destacado

Reemplaza el contenido de:

```text
src/app/app.html
```

por:

```html
<app-header />

<main class="app-shell">
  <section
    class="featured-event"
    aria-labelledby="featured-event-title"
  >
    <img
      class="featured-event__image"
      src="{{ featuredEvent.imageUrl }}"
      alt="{{ featuredEvent.title }}"
    />

    <div class="featured-event__content">
      <p class="featured-event__eyebrow">
        Evento destacado
      </p>

      <h1 id="featured-event-title">
        {{ featuredEvent.title }}
      </h1>

      <p class="featured-event__description">
        {{ featuredEvent.description }}
      </p>

      <p class="featured-event__meta">
        {{ featuredEvent.date }} · {{ featuredEvent.location }}
      </p>
    </div>
  </section>
</main>
```

En esta sesión conserva `src` y `alt` escritos mediante interpolación. El property binding se introducirá en F02.

---

## 8. Tarea 5 — Aplicar los estilos preparados del evento destacado

Actualiza:

```text
src/app/app.css
```

con los siguientes estilos:

```css
:host {
  display: block;
  min-height: 100dvh;
}

.app-shell {
  padding: 1.5rem;
}

.featured-event {
  display: grid;
  gap: 1.25rem;
  max-width: 960px;
  margin: 0 auto;
  padding: 1rem;
  background: var(--eh-surface);
  border: 1px solid var(--eh-line);
  border-radius: var(--eh-radius);
  box-shadow: var(--eh-shadow);
}

.featured-event__image {
  width: 100%;
  height: 220px;
  object-fit: cover;
  border-radius: calc(var(--eh-radius) - 8px);
}

.featured-event__content {
  display: grid;
  gap: 0.75rem;
  padding: 0.25rem 0.5rem 0.75rem;
}

.featured-event__eyebrow {
  color: var(--eh-brand);
  font-size: 0.8rem;
  font-weight: 700;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.featured-event__description,
.featured-event__meta {
  color: var(--eh-muted);
  line-height: 1.5;
}

.featured-event__meta {
  font-size: 0.95rem;
}

@media (min-width: 800px) {
  .featured-event {
    grid-template-columns: 1.1fr 0.9fr;
    align-items: center;
    padding: 1.25rem;
  }

  .featured-event__image {
    height: 280px;
  }
}
```

Las variables visuales globales ya están preparadas en `src/styles.css`; no debes recrearlas en este laboratorio.

---

## 9. Verificar el resultado

Regresa al navegador.

Debes ver:

- un encabezado de EventHub con logo y descripción;
- una tarjeta de evento destacado;
- la imagen del evento;
- el título **Angular Summit Lima**;
- su descripción;
- fecha y ubicación obtenidas desde el objeto TypeScript.

Realiza temporalmente un pequeño cambio en el valor de `title` dentro de `featuredEvent` y comprueba que el template se actualiza. Luego restaura el título original.

Con esto verificas que el template está mostrando estado del componente y no texto del evento escrito directamente en el HTML.

---

## 10. Validación técnica final

Detén el servidor de desarrollo si es necesario y ejecuta:

```bash
npm run build
```

El build debe finalizar sin errores.

Verifica además la estructura final:

```text
src/app/
├── app.config.ts
├── app.css
├── app.html
├── app.ts
│
├── events/
│   └── event-model.ts
│
└── layout/
    └── header/
        ├── header.css
        ├── header.html
        └── header.ts
```

---

## 11. Checklist de finalización

El laboratorio F01 está completo cuando se cumplen todos los puntos:

- [ ] el proyecto instala correctamente con `npm ci`;
- [ ] el proyecto inicia con `npm start`;
- [ ] `Header` es un componente Angular independiente;
- [ ] `App` importa y muestra `Header`;
- [ ] existe `EventModel` en `src/app/events/event-model.ts`;
- [ ] `featuredEvent` está tipado como `EventModel`;
- [ ] el template muestra los datos del evento mediante interpolación;
- [ ] la imagen local del evento carga correctamente;
- [ ] la aplicación muestra visualmente el header y el evento destacado;
- [ ] `npm run build` finaliza correctamente;
- [ ] no se han agregado Router, Signals, Services, Forms, HTTP, arrays de eventos ni `@for`.

---

## 12. Problemas frecuentes

### Angular no reconoce `app-header`

Verifica que `Header` esté importado en `app.ts` y agregado en:

```ts
imports: [Header]
```

### La imagen del evento no aparece

Utiliza exactamente la ruta del asset inicial:

```text
images/events/angular-summit-lima.svg
```

No muevas el asset dentro de `src/app`.

### TypeScript indica que `featuredEvent` no cumple `EventModel`

Compara el objeto con la interfaz y verifica que todas las propiedades requeridas existan y sean `string`.

### El template no puede leer `featuredEvent`

Mantén la propiedad dentro de `App` como:

```ts
protected readonly featuredEvent
```

y verifica que el template utilizado sea el de ese mismo componente.

### El proyecto falla después de generar Header

No agregues módulos, configuración de Router ni librerías de terceros. Compara el componente generado con la estructura standalone de Angular 22 utilizada en el curso.

---

## 13. Qué sigue

F01 trabaja intencionalmente con un solo evento.

En F02 EventHub evolucionará desde:

```text
un evento destacado
```

hacia:

```text
una colección de eventos
```

Ese cambio creará una necesidad real de:

- bindings adicionales;
- control de flujo;
- iteración;
- nuevas propiedades en el modelo;
- pipes de Angular.

No implementes todavía esas funcionalidades.