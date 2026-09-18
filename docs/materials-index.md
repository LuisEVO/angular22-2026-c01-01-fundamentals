# Angular 22 Course Materials Index

**Cycle:** 2026-C01  
**Repository:** `angular22-2026-c01-01-fundamentals`

This file is the source of truth for the status of educational materials. Chat attachments are drafts unless this index marks the corresponding artifact as approved.

## Status legend

- ✅ Approved
- 🟡 In review / in progress
- ⚪ Not started
- 🔒 Technical checkpoint frozen

## Fundamentals

### F01 — Introduction to Angular 22 and first components

| Artifact | Status | Source / location |
|---|---|---|
| Code checkpoint `f01-start` | 🔒 | Git tag `f01-start` |
| Code checkpoint `f01-solution` | 🔒 | Git tag `f01-solution` |
| Storyboard | ✅ | `docs/sessions/f01/storyboard.md` |
| Lab guide source | ✅ | `docs/sessions/f01/lab-guide.md` |
| Instructor guide source | ✅ | `docs/sessions/f01/instructor-guide.md` |
| Lab guide DOCX | ✅ | Google Drive / 2026-C01 / 01-Fundamentals / F01 / 01-Lab-Guide |
| Instructor guide DOCX | ✅ | Google Drive / 2026-C01 / 01-Fundamentals / F01 / 02-Instructor-Guide |
| Slide deck | 🟡 | Visual redesign pending |
| Visual asset manifest | 🟡 | `docs/sessions/f01/visual-assets.md` |

### F02
⚪ Not started

### F03
⚪ Not started

### F04
⚪ Not started

### F05
⚪ Not started

### F06
⚪ Not started

### F07
⚪ Not started

### F08
⚪ Not started

## Storage policy

### GitHub

GitHub stores text-based, versionable sources and code:

```text
docs/
├── eventhub-technical-spec.md
├── materials-index.md
└── sessions/
    └── f01/
        ├── storyboard.md
        ├── lab-guide.md
        ├── instructor-guide.md
        └── visual-assets.md
```

### Google Drive

Google Drive stores final binary deliverables using one canonical filename per artifact:

```text
Curso Angular 2026/
└── 2026-C01/
    ├── 00-Shared/
    │   └── Presentation-Templates/
    ├── 01-Fundamentals/
    │   ├── F01/
    │   │   ├── 01-Lab-Guide/
    │   │   ├── 02-Instructor-Guide/
    │   │   ├── 03-Slides/
    │   │   └── 04-Visual-Assets/
    │   ├── F02/
    │   └── ... F08/
    ├── 02-Advanced/
    │   └── A01/ ... A10/
    └── 03-Microfrontends/
        └── M01/ ... M06/
```

## Approval workflow

```text
Draft in chat
   ↓
Review
   ↓
APPROVED
   ↓
GitHub source updated
   ↓
Drive final artifact updated
   ↓
materials-index.md updated
```

Do not create filenames such as `final-v2`, `final-final`, etc. The canonical Drive file keeps one stable filename; Drive version history tracks replacements.
