# F01 Visual Asset Manifest

**Session:** F01 — Introducción a Angular 22 y primeros componentes  
**Status:** Approved  
**Approved assets:** 32  
**Purpose:** Source of truth for the visual/code assets used by the F01 slide deck.

## Production rules

- Use **D2** as the versionable source for conceptual and structural technical diagrams.
- Export final teaching visuals as **SVG**.
- Use **JetBrains Mono** for code.
- Preserve semantic code indentation exactly. In SVG, indentation is implemented through horizontal offsets per line rather than leading spaces.
- Route connector arrows so they do not cross node labels or content.
- Keep the academy visual language: purple/blue base, yellow accent, Montserrat for presentation text.
- PowerPoint is the final assembly layer.
- Do not use generative imagery as the source of truth for Angular APIs, code, or architecture.

## Approved source locations

```text
docs/sessions/f01/visuals/
├── README.md
├── manifest.json
├── render-d2.sh
└── sources/
    └── *.d2
```

## Approved delivery artifacts

- [Visual asset pack ZIP](https://drive.google.com/file/d/1eGMgHtiyMVwICNwUET-tLV7BYf2Gzbgf/view)
- [Visual asset preview](https://drive.google.com/file/d/1IPUnO0HiaM51Q5XtQBGMYK0GosBWGlMP/view)

The pack contains 32 approved SVG assets covering setup, TypeScript, components, EventHub state/template flow, Angular 22 historical context, demo guidance and the transition to F02.

## Canonical naming

```text
f01-v01-course-progression.svg
f01-c01-bootstrap-application.svg
f01-v02-bootstrap-flow.svg
...
```

All filenames and folders remain in English.
