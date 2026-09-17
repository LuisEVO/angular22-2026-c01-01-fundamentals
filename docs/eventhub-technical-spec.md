# EVENTHUB

## Especificación Técnica - Angular 22 Fundamentos

**Versión 1.0 - Contrato congelado para implementación**

Programa: Angular 22 Fundamentos (24 horas)
Proyecto integrador: EventHub
Destino: implementación con Cursor/Codex + QA del material

**Estado: APROBADO PARA IMPLEMENTACIÓN**

# 1. Propósito y alcance

Este documento consolida las decisiones técnicas aprobadas para implementar EventHub, proyecto integrador del nivel Angular 22 Fundamentos. Su función es actuar como contrato de implementación: Cursor, Codex u otro agente puede construir el repositorio siguiendo estas reglas sin reinterpretar decisiones curriculares ya cerradas.

> Principio rector: La prioridad no es crear una arquitectura enterprise genérica, sino una aplicación suficientemente realista para enseñar Angular 22 moderno de forma progresiva, coherente y reproducible.

## 1.1 Alcance

- Un único proyecto Angular 22 que evoluciona durante ocho sesiones.
- CRUD completo sobre los eventos privados del usuario.
- Catálogo público determinístico.
- Autenticación básica con access token en memoria.
- API mock local para F07 y API mock alojada para F08.
- Build y despliegue de una CSR SPA.
- Checkpoints técnicos reproducibles f01-start → f08-solution.

## 1.2 Fuera de alcance de Fundamentos

- Testing como contenido del alumno (reservado para A07 del nivel Avanzado).
- Refresh token, recuperación de sesión, rotación de tokens y concurrencia de refresh.
- SSR, SSG, hydration y rendering híbrido.
- NgRx, Signal Store, Repository/Facade/Store genéricos.
- Upload de archivos, almacenamiento de imágenes o multipart/form-data.
- Registro, verificación de correo y recuperación de contraseña.
- Microfrontends, CI/CD y observabilidad avanzada.

# 2. Línea base técnica

| Elemento | Decisión |
| --- | --- |
| Framework | Angular 22.x; fijar versión exacta 22.x.y al crear el repositorio. |
| Node.js | Node 24; `engines.node`: `>=24.15.0 <25`. La versión exacta certificada se registra en .nvmrc. |
| Package manager | npm. |
| TypeScript | La versión compatible resuelta por Angular 22; no forzar una versión externa. |
| Arquitectura | Standalone. |
| Type checking | Perfil strict de Angular CLI 22 (`ng new --strict`, también el default). Conservar las opciones strict generadas por Angular 22. No forzar a mano la opción paraguas `compilerOptions.strict` si el CLI no la genera. |
| Change detection | OnPush por defecto de Angular 22; no reconfigurar. |
| ZoneJS | No utilizar. Angular moderno es zoneless por defecto. |
| Rendering | CSR / SPA. |
| Styles | CSS convencional; sin framework UI. |
| State | Angular Signals. |
| Forms | Signal Forms. |
| HTTP | HttpClient + RxJS base + httpResource. |
| Testing | skip-tests en Fundamentos; QA técnico del material separado. |

> skip-tests es una decisión pedagógica del repositorio de Fundamentos. No constituye una recomendación de omitir pruebas en proyectos profesionales.

## 2.1 Reproducibilidad

- Versionar package-lock.json.
- Instalación de alumnos e instructor mediante npm ci.
- Incluir .nvmrc y engines.node (`>=24.15.0 <25`; versión certificada en `.nvmrc`).
- Fijar versiones exactas de dependencias directas (sin `^` ni `~`).
- Certificar ng build en cada checkpoint antes de publicar material.
- No depender de versiones floating para el repositorio definitivo.

## 2.2 Dependencias generadas vs features curriculares

Una dependencia puede existir en `package.json` antes de que su feature curricular se introduzca. "Todavía no introducido" significa que la aplicación no configura ni usa esa API, no que el paquete deba eliminarse del workspace.

En F01 permanecen `@angular/router` y `@angular/forms` porque forman parte de la línea base generada por Angular CLI. El requisito de la sesión es no configurar Router, no declarar rutas, no usar `RouterOutlet` y no usar APIs de Forms.

## 2.3 Configuración de IA

La configuración de AI/MCP se excluye del workspace inicial (equivalente a `ng new --ai-config=none`) y se introduce en F08. F01 no incluye `.vscode/mcp.json`.

# 3. Arquitectura del repositorio

La organización será feature-first. No se crearán carpetas globales genéricas como components/, services/ o models/ únicamente para agrupar tipos de archivos.

```text
src/app/
├── app.ts
├── app.html
├── app.css
├── app.config.ts
├── app.routes.ts
│
├── layout/
│   └── header/
│       ├── header.ts
│       ├── header.html
│       └── header.css
│
├── events/
│   ├── event-model.ts
│   ├── event-service.ts
│   ├── event-catalog-page/
│   ├── event-detail-page/
│   ├── event-filters/
│   ├── event-list/
│   └── event-card/
│
├── auth/
│   ├── auth-service.ts
│   ├── auth-guard.ts
│   ├── auth-interceptor.ts
│   └── login-page/
│
├── my-events/
│   ├── event-form-model.ts
│   ├── my-events-page/
│   └── event-form-page/
│
└── not-found-page/
```

## 3.1 Convenciones de naming

- Estilo de archivos Angular 2025: app.ts, header.ts, event-card.ts.
- Palabras separadas con guiones: event-service.ts, auth-guard.ts, auth-interceptor.ts.
- app.config.ts y app.routes.ts mantienen las convenciones específicas del workspace Angular.
- No usar event.service.ts / auth.service.ts como naming principal del curso.
- El modelo de dominio se llama EventModel para evitar colisión/confusión con el Event global del DOM.

## 3.2 Evolución, no scaffolding anticipado

Las features aparecen cuando la sesión las introduce. f01-start no contiene auth/, my-events/ ni app.routes.ts vacíos. La estructura del repositorio también forma parte del aprendizaje progresivo.

# 4. Modelo de dominio y contratos

## 4.1 EventCategory y EventModel

```typescript
export type EventCategory =
  | 'technology'
  | 'business'
  | 'design'
  | 'community';

export interface EventModel {
  id: string;
  title: string;
  description: string;
  date: string;
  location: string;
  category: EventCategory;
  imageUrl: string;
  availableSpots: number;
  isFeatured: boolean;
}
```

La fecha se transporta como string (formato ISO acordado por el mock). JSON no transporta instancias Date. DatePipe se encarga de la representación en template.

El contrato anterior es el modelo completo de destino. F01 usa un `EventModel` parcial (`title`, `description`, `date`, `location`, `imageUrl`) y **no incluye `id`**. `id`, `category`, `availableSpots` e `isFeatured` se introducen en F02, cuando el evento destacado evoluciona a una colección y hace falta identidad estable para `@for (...; track event.id)`.

## 4.2 EventFormModel

```typescript
export interface EventFormModel {
  title: string;
  description: string;
  date: string;
  location: string;
  category: EventCategory;
  imageUrl: string;
  availableSpots: number;
}
```

El formulario no expone id, ownerId ni isFeatured. La separación EventModel ≠ EventFormModel es intencional y pedagógica.

## 4.3 Autenticación

```typescript
export interface AuthUser {
  id: string;
  name: string;
  email: string;
}

export interface LoginRequest {
  email: string;
  password: string;
}

export interface LoginResponse {
  accessToken: string;
  user: AuthUser;
}

export interface ApiError {
  code: string;
  message: string;
}
```

> El access token de Fundamentos es opaco. No se enseña JWT, claims, decoding ni expiración avanzada en este nivel.

# 5. Contrato de la Mock API

El catálogo público y el CRUD privado son recursos separados. Esto evita que crear un evento privado modifique automáticamente el catálogo publicado y mantiene semántica REST clara.

| Método | Endpoint | Auth | Uso |
| --- | --- | --- | --- |
| POST | /api/auth/login | No | Autenticar / auto-provisionar usuario de laboratorio. |
| GET | /api/events | No | Catálogo público determinístico. |
| GET | /api/events/:id | No | Detalle público. |
| GET | /api/my-events | Sí | Listar eventos privados del usuario. |
| GET | /api/my-events/:id | Sí | Obtener un evento privado editable. |
| POST | /api/my-events | Sí | Crear evento privado. |
| PUT | /api/my-events/:id | Sí | Actualizar evento privado completo. |
| DELETE | /api/my-events/:id | Sí | Eliminar evento privado. |

## 5.1 Reglas de ownership

- ownerId existe solo internamente en el backend y nunca es decidido por el browser.
- El backend obtiene el usuario propietario desde el access token.
- Un usuario solo puede leer/modificar/eliminar eventos de su namespace privado.
- 401 = falta o invalidez de autenticación; 403 = usuario autenticado sin permiso; 404 = recurso inexistente.

## 5.2 Respuestas del CRUD

| Operación | Respuesta exitosa | Uso en estado local |
| --- | --- | --- |
| POST /my-events | 201 + EventModel canónico creado por servidor. | Append de la respuesta del servidor. |
| PUT /my-events/:id | 200 + EventModel canónico actualizado. | Replace por id usando la respuesta. |
| DELETE /my-events/:id | 204 No Content. | Remove por id después del éxito. |

# 6. Usuarios y datos seed

## 6.1 Usuarios de laboratorio

La API alojada utilizará auto-provisioning de aliases de laboratorio. En el primer login con un alias nuevo @eventhub.dev, el backend crea el usuario, guarda un hash de la contraseña elegida por el alumno y crea su dataset privado. No se utilizarán correos personales.

- Ejemplo: alumno-a91@eventhub.dev.
- La contraseña la elige el alumno en el primer login.
- El mismo alias + contraseña permite volver a acceder durante el laboratorio.
- No existe flujo curricular de registro, email verification, reset o recuperación de contraseña.

## 6.2 Catálogo público seed

| ID | Evento | Categoría | Cupos | Destacado |
| --- | --- | --- | --- | --- |
| angular-summit-lima | Angular Summit Lima | technology | 50 | Sí |
| frontend-architecture-day | Frontend Architecture Day | technology | 8 | No |
| ux-design-meetup | UX Design Meetup | design | 4 | No |
| product-design-lab | Product Design Lab | design | 12 | No |
| startup-business-night | Startup Business Night | business | 0 | No |
| community-hack-night | Community Hack Night | community | 30 | No |

Los IDs públicos son semánticos y estables para facilitar enseñanza y rutas legibles. Los eventos privados creados por usuarios pueden usar IDs generados.

## 6.3 Dataset privado inicial

Cada nuevo usuario recibe dos eventos privados seed. Esto permite practicar edición inmediatamente sin obligar a crear un registro antes.

# 7. Estado, HTTP y sincronización

## 7.1 Regla de estado

- Estado fuente mutable: WritableSignal privado dentro del responsable.
- Exposición: Signal/Resource readonly cuando el consumidor no debe mutar.
- Estado derivado: computed(), no duplicar estado mutable.
- Estado local de UI (p. ej. selectedCategory) permanece en el componente cuando no necesita compartirse.

## 7.2 Lecturas HTTP

F07 utiliza httpResource para lecturas reactivas. EventService encapsula el HttpResourceRef writable y expone un Resource readonly a los componentes.

```typescript
private readonly _myEventsResource =
  httpResource<EventModel[]>(/* request */);

readonly myEventsResource =
  this._myEventsResource.asReadonly();

readonly myEvents =
  this.myEventsResource.value;
```

## 7.3 Mutaciones: confirmación del servidor y reconciliación local

> Regla: No hacer reload() de toda la colección después de POST, PUT o DELETE como estrategia por defecto.

```text
POST    -> respuesta EventModel -> append local
PUT     -> respuesta EventModel -> replace local por id
DELETE  -> 204 confirmado        -> remove local por id

reload() -> reservado para reintento/refetch explícito cuando realmente sea necesario
```

No se implementan optimistic updates en Fundamentos. La UI cambia después de la respuesta exitosa del servidor; no se requiere rollback.

# 8. Evolución de autenticación

| Sesión | Estado de autenticación |
| --- | --- |
| F05 | AuthService simulado con Signal booleano; authGuard funcional. |
| F06 | LoginPage pasa a Signal Form email/password; AuthService sigue simulado. |
| F07 | POST /api/auth/login; accessToken y currentUser en Signals; isAuthenticated derivado con computed(). Headers Authorization explícitos en requests privados. |
| F08 | authInterceptor funcional agrega Authorization; EventService elimina headers manuales. Logout limpia token/user. Token sigue en memoria. |

## 8.1 Resource privado condicionado por sesión

En F07, el resource privado depende del token. Si no existe token, la función de request devuelve undefined y no se dispara la petición. En F08 se conserva esa dependencia para decidir cuándo cargar, pero el header deja de construirse allí porque lo agrega el interceptor.

```text
F07
accessToken() ? { url: '/api/my-events', headers: ... } : undefined

F08
accessToken() ? `${environment.apiUrl}/my-events` : undefined
            + authInterceptor para Authorization
```

> Hard refresh en rutas privadas pierde el access token en memoria y vuelve a login. La recuperación de sesión pertenece al nivel Avanzado.

# 9. Infraestructura local y producción

## 9.1 Mock API local

```text
eventhub/
├── src/
├── public/
└── tools/
    └── mock-api/
        ├── server.mjs
        ├── data.mjs
        └── auth.mjs
```

- Implementación mínima Node/Express tratada como infraestructura del curso.
- El alumno no desarrolla ni estudia el backend.
- Datos locales pueden ser in-memory y resetearse al reiniciar el servidor.
- No usar json-server como contrato principal porque necesitamos login, ownership y 401/403 controlados.

## 9.2 F07: proxy local

```text
Angular localhost:4200
       | /api
       v
Angular dev proxy
       |
       v
Mock API localhost:3000
```

F07 no dedica tiempo curricular a CORS.

## 9.3 F08: producción

- Introducir environments recién en F08.
- Desarrollo: apiUrl relativo/local según proxy.
- Producción: hosted Mock API.
- La hosted API debe tener CORS validado previamente por el instructor.
- Environment files no contienen secretos.

# 10. Matriz de checkpoints F01-F08

| Checkpoint | Estado técnico mínimo |
| --- | --- |
| F01 start | Workspace Angular moderno; app.config.ts; estilos/assets (incluidos los 6 SVG públicos); perfil strict generado por Angular 22; sin features; sin MCP. |
| F01 solution | Header + EventModel parcial (sin `id`) + featuredEvent con interpolación. |
| F02 solution | EventModel completo (incluye `id`); Event[] seed; @for/@if/@empty/bindings/pipes todavía en App. |
| F03 solution | event-catalog, event-filters, event-list, event-card; input()/output(); detailsRequested. |
| F04 solution | EventService; Signals; computed; filtro funcional; datos fuera del componente. |
| F05 solution | Router; page components; detalle; AuthService simulado; guard; MyEvents; 404; private seed local. |
| F06 solution | Signal Forms + FormRoot; Login form; EventFormPage create/edit; CRUD local completo incluido DELETE. |
| F07 start | F06 + tools/mock-api + proxy + scripts/dependencias de infraestructura. |
| F07 solution | httpResource; HttpClient/RxJS; login real; CRUD HTTP; auth header explícito; reconciliación local server-confirmed. |
| F08 solution | authInterceptor; removal de auth manual; environments; production build; deploy; deep-link validado; AI workflow. |

## 10.1 Regla de dependencia

Normalmente f02-start = f01-solution, etc. La excepción principal es f07-start, donde el instructor añade infraestructura de laboratorio que el alumno no debía construir en sesiones anteriores.

# 11. Evolución técnica por sesión

## F01 - Componentes y primer modelo

- Crear Header.
- Introducir EventModel parcial (`title`, `description`, `date`, `location`, `imageUrl`; sin `id`).
- Renderizar featuredEvent con interpolación (`src="{{ featuredEvent.imageUrl }}"`).
- Los seis assets públicos de eventos ya existen en `public/images/events/` desde f01-start.
- No Router configurado, no Services, no Signals formales, no Forms APIs, no MCP/AI.

## F02 - Templates y catálogo

- Completar EventModel y EventCategory, incluyendo `id`.
- Crear 6 eventos seed.
- Aplicar @for/@empty/@if, property binding y pipes.
- Mantener catálogo deliberadamente monolítico para preparar F03.

## F03 - Componentización

- Extraer EventCatalog, EventFilters, EventList y EventCard.
- EventCard recibe `input.required<EventModel>()`.
- detailsRequested se reexpone EventCard -> EventList -> EventCatalog.
- categorySelected se emite pero todavía no filtra.

## F04 - Signals, Service y DI

- Crear EventService con writable state privado + readonly exposure.
- selectedCategory queda en EventCatalog como estado local de UI.
- filteredEvents = computed().
- effect() solo tratamiento breve y no para derivar estado.

## F05 - Router y área privada

- EventCatalog pasa a EventCatalogPage.
- Agregar /events, /events/:id, /login, /my-events y 404.
- AuthService simulado + CanActivateFn.
- EventService incorpora myEvents locales seed.

## F06 - Signal Forms y CRUD local

- LoginPage se convierte en Signal Form.
- EventFormPage sirve para create/edit.
- FormRoot es el flujo principal de submission.
- EventService implementa create/update/delete locales sobre myEvents.

## F07 - HTTP

- Agregar infraestructura mock/proxy.
- Catálogo y myEvents pasan a recursos HTTP.
- AuthService usa POST /auth/login.
- Requests privados agregan Authorization explícitamente.
- POST/PUT/DELETE reconciliados localmente después de success.

## F08 - Interceptor y producción

- Crear authInterceptor funcional.
- Eliminar headers manuales de EventService.
- Agregar environments y hosted API.
- ng build + deploy SPA + deep-link refresh.
- IA: introducir la configuración MCP/AI del workspace; contexto -> restricciones -> propuesta -> revisión -> build/prueba.

# 12. Git, checkpoints y distribución

## 12.1 Repositorio maestro de authoring

```text
main = f08-solution

tags inmutables:
f01-start
f01-solution
f02-start
f02-solution
...
f08-solution
```

- Tags siempre lowercase para scripts/CI.
- El historial debe permanecer lineal cuando sea razonable.
- f02-start y f01-solution pueden apuntar al mismo commit.
- Cada solution debe ser autocontenida y ejecutable.

## 12.2 Distribución al alumno

El repositorio maestro no se publica necesariamente completo desde el primer día, porque expondría todas las solutions. La distribución al alumno se genera progresivamente desde el maestro: ZIP/start repo/checkpoint según la operación elegida por la academia.

> El master repo es una herramienta de authoring e instructor; no implica que todas las soluciones deban estar visibles para el alumno.

# 13. QA y criterios de aceptación

## 13.1 Por checkpoint

- npm ci debe finalizar correctamente.
- ng build debe finalizar sin error.
- El checkpoint debe iniciar sin pasos manuales no versionados.
- La funcionalidad mínima declarada para la sesión debe estar operativa.
- Un stretch goal nunca puede convertirse en dependencia obligatoria de una sesión posterior.

## 13.2 F07+

- Mock API local disponible mediante script documentado.
- Proxy funcional.
- 401/403/404 reproducibles según contrato.
- POST/PUT/DELETE actualizan estado local usando la confirmación del servidor sin refetch completo por defecto.

## 13.3 F08

- Hosted Mock API validada por el instructor antes de clase.
- CORS, credenciales/auto-provisioning y ownership certificados.
- Proveedor de hosting y cuenta del alumno preparados antes de la sesión.
- Deep link /events/:id + browser refresh debe funcionar después del deploy.
- No se considera terminado el despliegue solo porque / funciona.

# 14. Contrato de implementación para Cursor/Codex

El agente de implementación debe respetar estas reglas como restricciones de proyecto. No debe ampliar arquitectura o sustituir APIs sin una decisión explícita del autor del curso.

- **NO** introducir NgModules como arquitectura principal.
- **NO** añadir Angular Material, Tailwind, Bootstrap, NgRx, Signal Store o librerías de estado.
- **NO** crear Repository/Facade/BaseService/GenericCard u otras abstracciones prematuras.
- **NO** cambiar Signal Forms por Reactive Forms en EventHub.
- **NO** usar `*ngIf`/`*ngFor` como implementación principal.
- **NO** guardar access token en localStorage para aparentar persistencia.
- **NO** refetch completo después de cada mutación HTTP por defecto.
- **SÍ** preservar feature-first architecture y naming 2025.
- **SÍ** mantener la progresión exacta de checkpoints.
- **SÍ** actualizar estado privado con la respuesta canónica del servidor después de POST/PUT.
- **SÍ** mantener DELETE como CRUD obligatorio.
- **SÍ** ejecutar ng build antes de considerar válido cada checkpoint.

## 14.1 Orden de implementación recomendado

1. Crear y certificar f01-start.
2. Implementar f01-solution y etiquetar.
3. Continuar linealmente hasta f06-solution.
4. Agregar infraestructura mock/proxy como commit separado y etiquetar f07-start.
5. Implementar f07-solution y validar CRUD HTTP + auth.
6. Implementar f08-solution y validar interceptor + producción.
7. Ejecutar QA de todos los tags.
8. Solo después generar guías de laboratorio e instructor notes sobre código ya validado.

# 15. Registro consolidado de decisiones

| ID | Decisión consolidada |
| --- | --- |
| ET-01–03 | Un proyecto Angular 22 evolutivo; versiones exactas reproducibles; CSR/CSS/standalone; perfil strict generado por Angular CLI 22 (sin forzar `compilerOptions.strict` a mano). |
| ET-04 | skip-tests en Fundamentos. |
| ET-05–08 | Sin UI framework; feature-first; features aparecen progresivamente; sin abstracciones prematuras. |
| ET-09–11 | Mock API fuera de src; Node/Express mínimo; proxy local desde F07. |
| ET-12–14 | Historial/checkpoints; main final; contenido editorial separado del código. |
| ET-15–20 | EventModel, EventFormModel, AuthUser/Login contracts y token opaco. |
| ET-21–24 | Usuarios de laboratorio aislados; token de duración suficiente; ApiError estándar. |
| ET-25–35 | Contrato de API y ownership. |
| ET-36 | DELETE obligatorio; CRUD completo. |
| ET-37–45 | Seeds, IDs, aislamiento, reset, CORS, EventService simple, date string, assets locales. |
| ET-46 | Mutaciones confirmadas por servidor -> reconciliación local; no reload por defecto. |
| ET-47–86 | Matriz técnica de checkpoints, infraestructura y QA. |
| RT-01 | Event -> EventModel para evitar colisión con DOM Event. |
| RT-02 | Naming Angular 2025 con guiones. |
| RT-03 | app.config.ts existe desde F01. |
| RT-04 | CRUD privado coherente bajo /api/my-events. |
| RT-05–09 | Carga privada autocontenida, resource condicionado por auth, encapsulación readonly y reconciliación confirmada. |
| RT-10 | Auto-provisioning con password elegida por el alumno y alias @eventhub.dev. |
| RT-11–12 | Repo maestro separado de distribución; tags lowercase. |
| RT-13–15 | Environments en F08; naming final; sin capas nuevas. |
| RT-16 | Router/Forms pueden existir como paquetes instalados antes de configurarse o enseñarse. |
| RT-17 | AI/MCP se excluye del workspace inicial y se introduce en F08. |
| RT-18 | EventModel de F01 es parcial y no incluye `id` hasta F02. |

# 16. Referencias técnicas oficiales

Las siguientes fuentes oficiales fueron verificadas antes de congelar la especificación. Deben prevalecer sobre tutoriales antiguos si existe discrepancia durante la implementación.

- [Angular Style Guide](https://angular.dev/style-guide)
- [Angular CLI - ng new](https://angular.dev/cli/new)
- [Dependency Injection / @Service](https://angular.dev/essentials/dependency-injection)
- [Signal Forms - form()](https://angular.dev/api/forms/signals/form)
- [Signal Forms - FormRoot](https://angular.dev/api/forms/signals/FormRoot)
- [Signal Forms - form submission](https://angular.dev/guide/forms/signals/form-submission)
- [HttpClient setup](https://angular.dev/guide/http/setup)
- [httpResource](https://angular.dev/api/common/http/httpResource)
- [HttpResourceRef](https://angular.dev/api/common/http/HttpResourceRef)
> Versiones certificadas en este ciclo: Angular 22.1.7, Angular CLI/build 22.1.8, TypeScript 6.0.3, Node 24.16.0 (`engines.node`: `>=24.15.0 <25`).
