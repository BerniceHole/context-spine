# End-to-End Sample Trace

This trace shows one task moving through Context Spine from request to handoff. It is illustrative, not an additional required artifact.

## 1. User request

```txt
Add a preview before users download the design token export. Keep it small. Do not change the token schema.
```

## 2. Work order excerpt

```md
# T-0007: Add export preview for design tokens

## Goal
Show the exact export payload before download.

## Non-goals
- Do not redesign the token editor.
- Do not change the token schema.
- Do not add a new UI library.

## Scope
Allowed:
- app/export/**
- components/export-preview/**

Forbidden:
- auth/**
- billing/**
- database migrations

## Validation
- npm run lint
- npm run typecheck
- npm test
- manual check at 375px width
```

## 3. Implementation report excerpt

```md
## Work performed
- Added `ExportPreviewPanel`.
- Wired preview data to the existing export payload generator.
- Preserved the existing token schema.

## Files changed
- app/export/page.tsx
- components/export-preview/ExportPreviewPanel.tsx
- components/export-preview/ExportPreviewPanel.test.tsx
```

## 4. Validation record

```md
## Validated
Passed:
- npm run lint
- npm run typecheck
- npm test

Failed:
- none

Not run:
- manual 375px browser check — local browser was unavailable in this session
```

## 5. Doc-sync result

```md
State updated:
- ai-state/CURRENT_STATE.md — export flow now includes payload preview
- ai-state/HANDOFF.md — next session should manually check 375px viewport
- ai-state/tasks/T-0007.md — status changed to Done

No DECISIONS.md entry was added because the schema and architecture did not change.
```

## 6. Handoff excerpt

```md
## Current focus
Export preview is implemented; mobile visual verification remains open.

## Last completed
T-0007 added an export payload preview without changing token schema.

## Next action
Run manual browser verification at 375px and decide whether the preview needs copy refinement.

## Validation
Passed:
- lint
- typecheck
- tests

Not run:
- 375px browser check
```

The trace is complete because the implementation, validation evidence, state update, and next-session handoff all point to the same task.
