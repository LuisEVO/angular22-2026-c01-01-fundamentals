# F01 Instructor Guide v1.0

**Curso:** Angular 22 Fundamentos  
**Sesión:** F01 — Introducción a Angular 22 y primeros componentes  
**Proyecto:** EventHub  
**Base:** F01 Slide Storyboard v4 + checkpoints certificados `f01-start` / `f01-solution`  
**Duración:** 180 minutos  
**Uso:** guía interna del instructor

---

# 1. Cómo utilizar esta guía

Esta guía no reemplaza las slides ni la guía de laboratorio. Su propósito es desarrollar el discurso docente: qué explicar, cuánto profundizar, qué ejemplos utilizar, qué errores anticipar y dónde detenerse para proteger la progresión curricular.

La regla general de este curso es:

```text
Significado
   ↓
Problema
   ↓
Modelo mental
   ↓
API / sintaxis
   ↓
Aplicación en EventHub
```

Cuando una característica dependa de la versión de Angular, el instructor debe indicar la versión documentada del cambio. Si no existe evidencia oficial de una versión exacta, se debe describir el cambio con precisión sin inventar una fecha o versión.

---

# 2. Manejo operativo de la clase

## 2.1 Repositorio y checkpoints

Los tags `f01-start` y `f01-solution` pertenecen al repositorio maestro de autoría. No son el flujo normal del alumno durante la sesión.

El alumno recibe un starter equivalente a `f01-start` y trabaja sobre su propia copia. Durante clase:

```text
starter F01
   ↓
demo / práctica
   ↓
trabajo del alumno
   ↓
resultado funcional equivalente a f01-solution
```

El alumno no debe hacer push al repositorio maestro. `f01-solution` sirve al instructor como referencia, recuperación y fuente certificada para generar `f02-start`.

Un alumno que termine F01 correctamente puede continuar sobre su propio código. Si quedó atrasado o su proyecto está roto, en F02 puede partir del starter oficial equivalente a `f02-start`.

## 2.2 Antes de iniciar la sesión

Verificar:

- `f01-start` y `f01-solution` disponibles localmente;
- Node 24.16.0 y `npm ci` funcionando;
- demo clone separado del repositorio maestro;
- `npm start` y `npm run build` validados;
- guía de laboratorio F01 disponible;
- assets locales visibles sin depender de internet;
- slides abiertas y links oficiales accesibles;
- un plan de respaldo si el CLI o internet fallan.

## 2.3 Gestión del tiempo

El storyboard asigna 180 minutos. El laboratorio puede requerir entre 30 y 40 minutos según la cohorte. Si el grupo necesita más práctica, recortar primero:

1. discusión secundaria de naming;
2. preguntas opcionales de recap;
3. detalles no obligatorios de generics.

No recortar:

- significado de componente;
- interfaces/type safety;
- composición standalone;
- interpolación;
- contexto de standalone/zoneless/OnPush;
- laboratorio.

---

# 3. Guía slide por slide


## Slide 01 — Portada

**Tiempo sugerido:** 2 min  
**Objetivo docente:** Ubicar al grupo en la sesión, el nivel y el proyecto integrador.

### Explicación sugerida

Presenta el curso como una construcción progresiva: EventHub no es un proyecto separado de la teoría, sino el lugar donde cada concepto se vuelve necesario. Evita empezar enumerando APIs. El mensaje de apertura debe ser que la sesión construirá la primera pieza funcional y que el proyecto crecerá durante ocho sesiones.

Aclara que Fundamentos no significa “Angular antiguo” ni “Angular simplificado”: se trabajará desde el inicio con las convenciones y defaults de Angular 22, pero la profundidad aumentará de forma gradual.


### Cómo apoyar visualmente

Mostrar el branding de EventHub y una vista pequeña del resultado de F01.


### Pregunta para el grupo

¿Quiénes ya han trabajado con Angular? ¿Con qué versiones?


### Límite de profundidad

No entrar todavía a standalone, Signals, Zone.js o change detection.


### Transición

Conectar con el destino del nivel: “Antes de ver sintaxis, veamos hacia dónde crecerá EventHub.”



## Slide 02 — ¿Qué construiremos durante el nivel?

**Tiempo sugerido:** 3 min  
**Objetivo docente:** Dar una visión completa sin adelantar detalles técnicos.

### Explicación sugerida

Recorre la evolución F01→F08 como una historia de problemas. F01 crea la primera pieza; F02 necesita representar una colección; F03 divide una interfaz que ya empieza a crecer; F04 centraliza estado compartido; F05 introduce URLs y navegación; F06 permite editar datos; F07 deja de trabajar solo en memoria; F08 cierra autenticación y producción.

La intención no es que memoricen la ruta completa, sino que entiendan que cada sesión existe porque la anterior deja una limitación concreta.


### Cómo apoyar visualmente

Timeline de ocho pasos, cada uno con una miniatura de EventHub.


### Pregunta para el grupo

¿Qué problema creen que aparece cuando una aplicación deja de ser una sola pantalla?


### Límite de profundidad

No explicar todavía cómo funciona Router, Forms, HTTP o Signals.


### Transición

“Hoy nos quedamos en el primer peldaño: aplicación, TypeScript y componentes.”



## Slide 03 — Objetivos de F01

**Tiempo sugerido:** 2 min  
**Objetivo docente:** Hacer explícito qué se espera aprender y qué no.

### Explicación sugerida

Lee los objetivos como capacidades observables: explicar, reconocer, crear, modelar y mostrar. Destaca que no se evaluará memoria de definiciones, sino la capacidad de leer y modificar una aplicación Angular sencilla.

Puedes remarcar que el bloque TypeScript es un repaso: se enseñará lo necesario para leer el código de Angular, no un curso completo de TypeScript.


### Pregunta para el grupo

¿Cuál de estos objetivos les resulta más familiar y cuál más nuevo?


### Límite de profundidad

No convertir esta slide en una lista larga de contenidos.


### Transición

Pasar de objetivos a la pregunta fundamental: “¿Qué es Angular y por qué usarlo?”



## Slide 04 — ¿Qué es Angular?

**Tiempo sugerido:** 6 min  
**Objetivo docente:** Construir una definición útil y no dependiente de APIs.

### Explicación sugerida

Introduce Angular como un framework para construir aplicaciones web organizadas a partir de componentes y un conjunto integrado de herramientas. Explica “framework” en términos sencillos: no es solo una librería que llamamos cuando queremos; también propone estructura, convenciones y mecanismos para resolver problemas comunes de una aplicación.

Muestra que Angular cubre varias necesidades —componentes, templates, routing, forms, HTTP, dependency injection y tooling— pero evita describirlas en detalle. La idea importante es que esas capacidades forman un ecosistema coherente y que aparecerán cuando EventHub las necesite.

Diferencia Angular de HTML/CSS/JavaScript: estos siguen existiendo. Angular organiza cómo construimos encima de ellos.


### Cómo apoyar visualmente

Diagrama: una aplicación web al centro y alrededor componentes, templates, routing, forms, HTTP, DI y tooling.


### Pregunta para el grupo

Si solo tuviéramos HTML, CSS y JavaScript, ¿qué problemas repetiríamos al crecer la aplicación?


### Error o confusión frecuente

“Angular reemplaza JavaScript.” No: Angular se apoya en JavaScript/TypeScript, HTML y CSS.


### Límite de profundidad

No comparar todavía con React/Vue; desviaría la sesión.


### Transición

“Si Angular corre en el navegador, veamos cómo pasa de un HTML vacío a una aplicación.”


### Referencias

[R2]



## Slide 05 — Del navegador a una aplicación Angular

**Tiempo sugerido:** 5 min  
**Objetivo docente:** Dar un modelo mental simple del arranque de la aplicación.

### Explicación sugerida

Explica la cadena de forma visual. El navegador carga `index.html`; ese documento contiene el host `<app-root>`. El bundle de la aplicación ejecuta `main.ts`; `main.ts` inicia Angular; Angular crea el componente raíz `App` y renderiza su template dentro del host que coincide con su selector.

Esta explicación prepara `bootstrapApplication` sin introducir todavía todos sus detalles. Recalca que una aplicación Angular termina produciendo DOM real en el navegador.


### Cómo apoyar visualmente

Flujo Browser → index.html (`<app-root>`) → main.ts → bootstrap → App → árbol de componentes.


### Pregunta para el grupo

¿Qué ocurriría si el selector del componente raíz no coincidiera con el elemento del HTML?


### Error o confusión frecuente

“Angular reemplaza index.html.” No: `index.html` sigue siendo el documento host.


### Límite de profundidad

No entrar a bundlers, hydration o SSR.


### Transición

“Ahora miremos el código exacto que hace ese bootstrap en EventHub.”



## Slide 06 — ¿Cómo arranca EventHub?

**Tiempo sugerido:** 6 min  
**Objetivo docente:** Leer `bootstrapApplication` sin convertirlo en una clase de configuración.

### Explicación sugerida

Muestra el `main.ts` real. Explica que `bootstrapApplication(App, appConfig)` recibe el componente raíz y una configuración de aplicación. `App` es la primera raíz del árbol de componentes. `appConfig` concentra providers/configuración global que crecerá más adelante.

Señala que en F01 `appConfig` es pequeño. Más adelante aparecerán Router, interceptors u otros providers, pero no hay necesidad de anticiparlos.

Relaciona el `.catch(...)` con una idea JavaScript conocida: si falla el bootstrap, registramos el error.


### Cómo apoyar visualmente

Resaltar en el snippet `App`, `appConfig` y `bootstrapApplication` con tres callouts.


### Pregunta para el grupo

¿Cuál creen que es la responsabilidad de `main.ts`: contener lógica del negocio o iniciar la aplicación?


### Error o confusión frecuente

“Todo debe configurarse en main.ts.” No: debe seguir siendo un punto de entrada pequeño.


### Límite de profundidad

No explicar `ApplicationRef` ni internals del bootstrap.


### Transición

“Para orientarnos en el código, veamos los pocos archivos que nos importan hoy.”


### Referencias

[R2]



## Slide 07 — Anatomía mínima del workspace

**Tiempo sugerido:** 5 min  
**Objetivo docente:** Distinguir código de aplicación, assets y configuración.

### Explicación sugerida

Recorre solo las carpetas que el alumno tocará. `src/app` contiene el código de la aplicación; `main.ts` es el punto de entrada; `styles.css` son estilos globales; `public` contiene assets estáticos; `package.json` describe scripts y dependencias.

Menciona `angular.json` y `tsconfig.json` únicamente como configuración del workspace y del compilador. No los abras en profundidad en F01. La meta es que el alumno no se sienta perdido al abrir el repositorio.


### Cómo apoyar visualmente

Árbol de carpetas con colores distintos para application code, assets y configuración.


### Pregunta para el grupo

¿Dónde pondrían una imagen estática que no pertenece a un componente concreto?


### Error o confusión frecuente

“Todo vive en src/app.” No; assets y configuración tienen ubicaciones distintas.


### Límite de profundidad

No explicar builders, budgets ni tsconfig inheritance todavía.


### Transición

“Antes de escribir código, necesitamos una línea base reproducible.”



## Slide 08 — Baseline certificado del curso

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Explicar por qué el curso fija versiones concretas.

### Explicación sugerida

Distingue entre compatibilidad oficial y versiones certificadas del curso. Angular 22 admite rangos concretos de Node y TypeScript, pero el curso fija versiones exactas para reducir variaciones entre equipos. El repositorio usa Angular framework 22.1.7, CLI 22.1.8, Node 24.16.0, TypeScript 6.0.3 y npm 11.13.0.

Explica `package-lock.json` como la foto exacta del árbol de dependencias y `npm ci` como la instalación reproducible basada en ese lockfile. `.nvmrc` ayuda a usar la versión de Node certificada.


### Cómo apoyar visualmente

Cuatro bloques: package.json + package-lock.json + .nvmrc + npm ci → mismo entorno.


### Pregunta para el grupo

¿Por qué un curso podría fallar si cada alumno instala versiones distintas aunque todos usen Angular 22?


### Error o confusión frecuente

“La versión certificada es la única soportada por Angular.” No: es la elegida por el curso dentro del rango oficial.


### Límite de profundidad

No enseñar semver en profundidad.


### Transición

“Con el entorno fijo, hagamos el repaso mínimo de TypeScript que necesitaremos para leer Angular.”


### Referencias

[R1]



## Slide 09 — ¿Por qué Angular utiliza TypeScript?

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Dar una definición precisa y simple de TypeScript.

### Explicación sugerida

Usa la definición acordada: TypeScript es un lenguaje que extiende JavaScript con sintaxis para tipos y análisis estático. Explica “análisis estático” como revisar el programa antes de ejecutarlo para detectar inconsistencias que el editor y el compilador pueden señalar.

Aclara la cadena: escribimos TypeScript, el tooling comprueba tipos y se produce JavaScript que es lo que finalmente ejecutan navegador o Node.js. Los tipos no viajan al navegador como un sistema de tipos runtime.

Conecta con Angular: componentes, Signals, servicios, HTTP y formularios exponen APIs fuertemente tipadas, por lo que entender los tipos mejora mucho la experiencia de desarrollo.


### Cómo apoyar visualmente

TypeScript source → type checking → JavaScript → Browser/Node.js.


### Pregunta para el grupo

¿Un error de TypeScript significa necesariamente que el navegador ya ejecutó la línea?


### Error o confusión frecuente

“TypeScript valida datos recibidos de una API en runtime.” No necesariamente; el tipado estático no sustituye validación runtime.


### Límite de profundidad

No hablar de la implementación interna del compilador ni de versiones de TypeScript fuera de Angular 22.


### Transición

“Empecemos por los tres tipos que aparecerán todo el tiempo.”


### Referencias

[R8]



## Slide 10 — Tipos básicos: string, number, boolean

**Tiempo sugerido:** 5 min  
**Objetivo docente:** Reforzar los tipos primitivos esenciales.

### Explicación sugerida

Presenta `string`, `number` y `boolean` con datos de EventHub. `title` es texto, `availableSpots` es un número y `isFeatured` representa una condición verdadera/falsa. Muestra que `'50'` y `50` no son el mismo tipo aunque visualmente parezcan cercanos.

Subraya que los nombres de los tipos primitivos se escriben en minúscula. No uses `String`, `Number` o `Boolean` como tipos; la documentación de TypeScript recomienda los tipos primitivos en minúscula.

Haz una pequeña conexión con el dominio: elegir un tipo comunica intención. `availableSpots: number` permite sumar o comparar; un `string` no expresa esa misma intención.


### Cómo apoyar visualmente

Tres tarjetas con un ejemplo real y su tipo; luego error `availableSpots = '50'`.


### Pregunta para el grupo

¿Qué tipo usarían para indicar si un evento está agotado?


### Error o confusión frecuente

“Todo dato que viene de un input HTML ya es number si esperamos un número.” No; frecuentemente llega como texto y debe manejarse apropiadamente.


### Límite de profundidad

No introducir `bigint`, `symbol`, tuples o enums.


### Transición

“No siempre hace falta escribir el tipo explícitamente: TypeScript puede inferirlo.”


### Referencias

[R8]



## Slide 11 — Inferencia: TypeScript puede deducir el tipo

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Evitar anotaciones redundantes y explicar inferencia.

### Explicación sugerida

Muestra que `const title = 'Angular Summit Lima'` ya le da a TypeScript suficiente información para conocer que el valor es un `string`. Lo mismo con `number` y `boolean`. Compara con una anotación explícita cuando el tipo aporta contexto o cuando la variable se declara antes de tener valor.

La idea práctica: no enseñar a llenar el código de anotaciones innecesarias. En TypeScript moderno se combina inferencia con tipos explícitos en fronteras relevantes: modelos, parámetros, contratos, APIs públicas.


### Cómo apoyar visualmente

Valor a la izquierda → tipo inferido a la derecha; comparar anotación explícita vs inferida.


### Pregunta para el grupo

¿Qué ventaja tiene que el editor conozca el tipo aunque nosotros no lo escribamos?


### Error o confusión frecuente

“Si no escribo `: string`, la variable no tiene tipo.” Falso; TypeScript puede inferirlo.


### Límite de profundidad

No explicar literal widening ni inferencia avanzada.


### Transición

“Cuando varios valores forman un objeto, necesitamos describir la forma completa.”


### Referencias

[R8]



## Slide 12 — Interfaces: describir la forma de los datos

**Tiempo sugerido:** 5 min  
**Objetivo docente:** Entender interface como contrato estructural.

### Explicación sugerida

Define una interface como una descripción de las propiedades que esperamos en un objeto y del tipo de cada propiedad. Usa `EventModel` como ejemplo. Explica que la interface no crea el objeto, no reserva memoria y no existe como objeto de runtime; sirve al sistema de tipos.

Muestra un objeto incompleto y el error que produce. Este es el puente directo hacia el laboratorio: el alumno verá cómo TypeScript obliga a que `featuredEvent` cumpla el contrato.

Aprovecha para introducir el concepto de “modelo”: una representación de datos relevante para nuestra aplicación.


### Cómo apoyar visualmente

Interface como plantilla/contrato a la izquierda; objeto que debe encajar a la derecha.


### Pregunta para el grupo

¿Qué pasaría si `date` fuera `number` en el objeto pero `string` en la interface?


### Error o confusión frecuente

“Interface es una clase.” No: no tiene constructor ni crea instancias por sí sola.


### Límite de profundidad

No comparar `interface` vs `type` todavía.


### Transición

“A veces no queremos cualquier string, sino solo un conjunto pequeño de alternativas.”


### Referencias

[R8]



## Slide 13 — Unions: más de un valor permitido

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Entender cómo restringir alternativas válidas.

### Explicación sugerida

Explica que una union expresa que un valor puede pertenecer a varias alternativas. Primero muestra `string | null`, que es fácil de entender. Después muestra una union de literales para `EventCategory`: no cualquier texto es válido; solo las categorías permitidas.

Aclara que `EventCategory` aparece aquí como repaso de TypeScript, pero se implementará realmente en F02. Eso evita que el alumno empiece a modificar el modelo antes de tiempo.


### Cómo apoyar visualmente

Conjunto visual de cuatro categorías permitidas; `sports` queda fuera con una X.


### Pregunta para el grupo

¿Qué ventaja tiene `EventCategory` frente a usar simplemente `string`?


### Error o confusión frecuente

“Union significa array de tipos.” No; describe alternativas para un valor.


### Límite de profundidad

No entrar a discriminated unions ni narrowing avanzado.


### Transición

“Ahora veamos una idea que aparecerá mucho en APIs Angular: los generics.”


### Referencias

[R9]



## Slide 14 — Generics: tipos reutilizables sin perder información

**Tiempo sugerido:** 5 min  
**Objetivo docente:** Dar un modelo mental de generics sin profundizar en TypeScript avanzado.

### Explicación sugerida

Empieza con el problema de `any`: una función genérica con `any` acepta todo, pero también pierde información. Luego presenta `T` como un marcador que captura el tipo de entrada para reutilizarlo en la salida.

Usa el diagrama `EventModel[] → first<T> → EventModel | undefined`. La intención no es que escriban funciones genéricas complejas; deben poder leer `<EventModel>` cuando más adelante aparezca en `input<EventModel>()`, `Observable<EventModel[]>` o `httpResource<EventModel[]>()`.

Puedes decir: “El generic permite que una API sea reutilizable sin olvidar con qué tipo concreto estamos trabajando.”


### Cómo apoyar visualmente

Una caja `T` que se llena con `EventModel` y viaja del input al output.


### Pregunta para el grupo

Si usáramos `any`, ¿qué información perdería el editor después de llamar a la función?


### Error o confusión frecuente

“T es un tipo especial de Angular.” No: es una convención de TypeScript para un parámetro de tipo.


### Límite de profundidad

No enseñar constraints, conditional types o mapped types.


### Transición

“Ya podemos leer el tipo de `featuredEvent`; falta entender dos palabras que veremos en esa declaración.”


### Referencias

[R10]



## Slide 15 — readonly, protected y visibilidad

**Tiempo sugerido:** 3 min  
**Objetivo docente:** Preparar al alumno para leer `protected readonly featuredEvent`.

### Explicación sugerida

Explica `protected` en el contexto del style guide de Angular: para miembros que están destinados al template pero no forman parte de la API pública del componente, Angular recomienda `protected`. El template puede leerlos.

Explica `readonly` con precisión: evita reasignar la propiedad, pero no convierte automáticamente el objeto completo en inmutable. En nuestro caso expresa que `featuredEvent` no será reemplazado durante F01.

Reconoce `public` y `private` sin profundizar. Señala que la ausencia de modificador en TypeScript implica `public`.


### Cómo apoyar visualmente

Separar visualmente `protected` (visibilidad) y `readonly` (reasignación).


### Pregunta para el grupo

¿`readonly` impide cambiar una propiedad interna del objeto? (Respuesta: no necesariamente.)


### Error o confusión frecuente

“readonly = deep immutable.” Falso.


### Límite de profundidad

No entrar a herencia, `#private` fields ni detalles de emisión JavaScript.


### Transición

“Con esta base de TypeScript, ya podemos hablar de la unidad central de una UI Angular: el componente.”


### Referencias

[R6] [R11]



## Slide 16 — ¿Qué es un componente?

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Construir una definición conceptual antes de la API.

### Explicación sugerida

Presenta la frase central: un componente es uno de los bloques fundamentales con los que construimos una interfaz Angular. Cada componente representa una parte de la página con una responsabilidad concreta.

Usa ejemplos visibles: header, tarjeta de evento, lista, formulario. Haz énfasis en que un componente puede ser pequeño o grande, pero debe representar una pieza coherente de UI.

Relaciona con composición: una aplicación Angular no es “un componente gigante”, sino un árbol de componentes que colaboran.


### Cómo apoyar visualmente

Mock de una página segmentada en Header, EventCard, EventList y Footer.


### Pregunta para el grupo

¿Qué partes de una página de ecommerce convertirían en componentes?


### Error o confusión frecuente

“Cada `div` debería ser un componente.” No; el criterio es responsabilidad/cohesión, no cada nodo HTML.


### Límite de profundidad

No mostrar `@Component` hasta la siguiente slide.


### Transición

“Ahora que sabemos qué representa un componente, veamos qué problema resuelve dividir así la interfaz.”


### Referencias

[R2]



## Slide 17 — ¿Qué problema resuelve un componente?

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Explicar separación de responsabilidades y mantenibilidad.

### Explicación sugerida

Compara una página donde HTML, estado y comportamiento crecen juntos frente a una estructura dividida por responsabilidades. El objetivo no es vender “reutilización” como única razón; también importan comprensión, aislamiento y evolución.

Usa EventHub: si Header y catálogo cambian por razones distintas, conviene que tengan fronteras distintas. Más adelante EventCard tendrá su propia entrada de datos y acciones, pero todavía no hace falta introducir inputs/outputs.


### Cómo apoyar visualmente

Antes: bloque monolítico. Después: árbol App → Header + EventList → EventCard.


### Pregunta para el grupo

¿Un componente que solo se usa una vez puede seguir siendo útil? Sí, si separa una responsabilidad clara.


### Error o confusión frecuente

“Solo extraemos componentes si se reutilizan.” Reutilización es una razón, no la única.


### Límite de profundidad

No entrar a smart/dumb components ni arquitectura de contenedores.


### Transición

“Angular necesita una forma de convertir esa idea de componente en código.”


### Referencias

[R2]



## Slide 18 — ¿Cómo representa Angular un componente?

**Tiempo sugerido:** 6 min  
**Objetivo docente:** Entender las piezas principales de `@Component`.

### Explicación sugerida

Muestra el código real de `Header`. Explica el decorador `@Component` como metadata que le dice a Angular cómo tratar esa clase como componente. Recorre `selector`, `imports`, `templateUrl` y `styleUrl`.

`selector` define el elemento que usaremos en HTML. `imports` declara dependencias disponibles para el template de un componente standalone. `templateUrl` apunta a la estructura HTML y `styleUrl` a los estilos del componente. La clase contiene estado y comportamiento.

Señala que no aparece `standalone: true`; en Angular actual es el default. La explicación histórica se reserva para el bloque “Cómo llegamos a Angular 22”.


### Cómo apoyar visualmente

Snippet con flechas desde cada propiedad hacia su responsabilidad.


### Pregunta para el grupo

¿Qué propiedad determina cómo escribimos el componente en otro template?


### Error o confusión frecuente

“El selector es el nombre del archivo.” No; es el selector CSS/HTML declarado en metadata.


### Límite de profundidad

No explicar todas las propiedades disponibles en `@Component`.


### Transición

“Estas piezas no viven aisladas: clase, template y estilos forman una sola unidad conceptual.”


### Referencias

[R3]



## Slide 19 — Clase, template y estilos trabajan juntos

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Evitar que el alumno reduzca componente a la clase TypeScript.

### Explicación sugerida

Explica la responsabilidad de cada archivo. La clase contiene datos/comportamiento; el template describe lo que se renderiza; los estilos controlan presentación. Angular vincula estas piezas mediante la metadata.

Aclara que Angular también permite templates y styles inline, pero el curso usa archivos separados para mantener claridad pedagógica. No conviertas esto en una discusión de “mejor práctica universal”.


### Cómo apoyar visualmente

Triángulo o tres cajas conectadas: class ↔ template ↔ styles.


### Pregunta para el grupo

¿Dónde colocarían una regla que cambia el color del Header? ¿Y el título que debe mostrar?


### Error o confusión frecuente

“HTML y CSS dejan de ser HTML y CSS por estar en Angular.” No; siguen usando tecnologías web.


### Límite de profundidad

No entrar a encapsulation modes todavía.


### Transición

“Cuando un componente necesita otro, Angular usa composición.”


### Referencias

[R3]



## Slide 20 — Composición: construir una interfaz con componentes

**Tiempo sugerido:** 5 min  
**Objetivo docente:** Explicar cómo un componente usa a otro en standalone.

### Explicación sugerida

Define composición como construir una pieza mayor usando piezas menores. En `App`, importamos `Header` en `imports` y luego utilizamos su selector `<app-header />` en el template.

Explica los tres pasos de forma repetible: import TypeScript, registrar en `imports`, usar selector en template. Esta secuencia será recurrente durante todo el curso.

Relaciona con árbol de componentes: Angular crea una instancia de Header cuando encuentra un elemento que coincide con su selector.


### Cómo apoyar visualmente

App arriba, flecha a Header; al lado los tres pasos: import → imports[] → selector.


### Pregunta para el grupo

¿Qué paso faltaría si importo la clase TypeScript pero no la agrego a `imports`?


### Error o confusión frecuente

“El import ES y `imports` de `@Component` son lo mismo.” No: uno resuelve el módulo TS; el otro declara dependencia del template.


### Límite de profundidad

No explicar NgModule aquí; se verá históricamente después.


### Transición

“Podemos crear estos archivos a mano, pero Angular CLI automatiza el scaffolding.”


### Referencias

[R2] [R3]



## Slide 21 — Angular CLI crea la estructura repetitiva

**Tiempo sugerido:** 3 min  
**Objetivo docente:** Mostrar el valor del CLI sin convertirlo en magia.

### Explicación sugerida

Ejecuta mentalmente `ng generate component layout/header --skip-tests`. Explica que un schematic genera una estructura consistente y aplica defaults del workspace. En nuestro curso los tests están omitidos deliberadamente en Fundamentos, por eso `--skip-tests` es coherente con el starter.

Aclara que usar CLI no exime de entender el código generado. Después del comando, el alumno debe poder explicar cada archivo.


### Cómo apoyar visualmente

Comando → tres archivos generados.


### Pregunta para el grupo

¿Qué ventaja tiene que toda la clase genere componentes con el mismo comando?


### Error o confusión frecuente

“CLI es obligatorio para crear componentes.” No; es tooling conveniente.


### Límite de profundidad

No enseñar aliases ni todas las opciones del schematic.


### Transición

“Ya tenemos la estructura; ahora vamos a darle datos reales a EventHub.”



## Slide 22 — EventModel: nuestro primer modelo

**Tiempo sugerido:** 4 min  
**Objetivo docente:** Conectar interfaces con el dominio real de EventHub.

### Explicación sugerida

Presenta el `EventModel` real de F01. Explica que un modelo representa los datos relevantes para el problema actual. En F01 solo necesitamos título, descripción, fecha, ubicación e imagen.

Subraya la decisión de progresión: no agregamos `id`, categoría o cupos todavía porque aún no existe el problema que los necesita. El modelo crecerá en F02.

Esto enseña a evitar diseñar de más y muestra que los tipos también evolucionan con los requisitos.


### Cómo apoyar visualmente

Interface al centro con cada propiedad conectada a una zona de la tarjeta visual.


### Pregunta para el grupo

¿Por qué no agregamos `availableSpots` si sabemos que existirá después?


### Error o confusión frecuente

“Un modelo debe tener desde el inicio todos los campos posibles.” No.


### Límite de profundidad

No discutir DTO/domain model todavía.


### Transición

“Ahora necesitamos un valor real que cumpla ese contrato.”