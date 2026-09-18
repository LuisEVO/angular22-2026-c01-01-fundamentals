# F01 Visual Asset Manifest

**Session:** F01 — Introducción a Angular 22 y primeros componentes  
**Status:** In progress  
**Purpose:** Track every visual/code asset used by the F01 slide deck.

## Production rules

- Use **Snappify** for polished code snippets, highlights, before/after comparisons, and code annotations.
- Use **Mermaid** as the source format for deterministic technical diagrams.
- Use **Figma / FigJam** for final branded diagrams when Mermaid output needs visual polish.
- Use **Napkin AI** only for conceptual infographics where exact API/code representation is not required.
- Prefer SVG for diagrams and PNG only when a tool cannot export SVG cleanly.
- Do not use generative imagery as the source of truth for Angular APIs, code, or architecture.

## Asset inventory

| ID | Slide | Type | Asset | Tool | Status |
|---|---:|---|---|---|---|
| F01-V01 | 02 | Diagram | EventHub course progression F01→F08 | Figma / PowerPoint | Planned |
| F01-V02 | 05 | Diagram | Browser → index.html → main.ts → bootstrap → App | Mermaid → Figma | Planned |
| F01-C01 | 06 | Code | `bootstrapApplication(App, appConfig)` | Snappify | Planned |
| F01-V03 | 07 | Diagram | Minimal workspace tree | Figma / PowerPoint | Planned |
| F01-V04 | 08 | Diagram | Reproducible baseline | Figma / PowerPoint | Planned |
| F01-C02 | 09 | Code/flow | TypeScript → type checking → JavaScript | Snappify + Figma | Planned |
| F01-C03 | 10 | Code | `string`, `number`, `boolean` examples | Snappify | Planned |
| F01-C04 | 11 | Code | Type inference examples | Snappify | Planned |
| F01-C05 | 12 | Code | `EventModel` interface | Snappify | Planned |
| F01-V05 | 12 | Diagram | Interface contract → object | Figma | Planned |
| F01-C06 | 13 | Code | Union type examples | Snappify | Planned |
| F01-C07 | 14 | Code | Generic `first<T>` example | Snappify | Planned |
| F01-V06 | 14 | Diagram | `EventModel[] → first<T> → EventModel` | Mermaid → Figma | Planned |
| F01-C08 | 15 | Code | `protected readonly` declaration | Snappify | Planned |
| F01-V07 | 16 | Diagram | UI decomposed into components | Figma | Planned |
| F01-V08 | 17 | Diagram | Monolith → component tree | Figma | Planned |
| F01-C09 | 18 | Code | `@Component` anatomy | Snappify | Planned |
| F01-V09 | 18 | Diagram | Metadata callouts | Figma | Planned |
| F01-V10 | 19 | Diagram | Class + template + styles | Mermaid → Figma | Planned |
| F01-C10 | 20 | Code | Component composition | Snappify | Planned |
| F01-V11 | 20 | Diagram | App → Header | Mermaid → Figma | Planned |
| F01-C11 | 21 | Code | Angular CLI component generation | Snappify | Planned |
| F01-C12 | 22 | Code | Final F01 `EventModel` | Snappify | Planned |
| F01-C13 | 23 | Code | `featuredEvent` | Snappify | Planned |
| F01-C14 | 24 | Code | Interpolation examples | Snappify | Planned |
| F01-V12 | 25 | Diagram | State → Template → UI | Mermaid → Figma | Planned |
| F01-V13 | 26 | Diagram | F01 final architecture | Mermaid → Figma | Planned |
| F01-V14 | 27 | Timeline | Angular traditional → v19 → v21 → v22 | Figma | Planned |
| F01-C15 | 28 | Code comparison | NgModule vs standalone | Snappify | Planned |
| F01-V15 | 28 | Diagram | NgModule intermediary vs standalone imports | Figma | Planned |
| F01-V16 | 29 | Diagram | Zone.js model vs zoneless | Figma | Planned |
| F01-V17 | 30 | Diagram | Zoneless vs OnPush responsibilities | Figma | Planned |
| F01-C16 | 31 | Code/text comparison | v19 naming vs v20+ naming | Snappify / Figma | Planned |
| F01-V18 | 32 | Flow | Demo steps | Figma | Planned |
| F01-C17 | 33 | Code | Intentional type error | Snappify | Planned |
| F01-V19 | 35 | Screenshot | Expected F01 EventHub result | Browser screenshot | Planned |
| F01-V20 | 37 | Diagram | One event → collection problem | Figma | Planned |

## File naming convention

Use:

```text
f01-v01-course-progression.svg
f01-c01-bootstrap-application.png
f01-v02-bootstrap-flow.svg
...
```

All filenames and folders remain in English.
