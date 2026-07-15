# Bounded Correction and Integration Sample

This trace shows one accepted Bounded work order carrying an implementation through fresh review, an in-scope correction, revalidation, and a local commit.

## 1. Accepted work-order excerpt

```md
# T-0012: Restore focus after closing export preview

## Status
Accepted

## Goal
Return keyboard focus to the preview trigger when the existing export preview closes.

## Non-goals
- Do not redesign the preview.
- Do not add a dependency.
- Do not change analytics, privacy policy, or deployment behavior.

## Scope
Allowed:
- components/export-preview/**
- existing tests for the export preview

Forbidden:
- package manifests and lockfiles
- analytics/**
- database/**
- deployment configuration

## Authority envelope
- Authority source: accepted T-0012 work order
- Execution surface and host: local repository checkout
- Canonical revision: recorded before implementation
- Allowed effects: local file and Git mutations only
- External effects: none
- Active writer and integration owner: primary implementation agent
- Safe stop: revision mismatch, writer conflict, or required out-of-scope change

## Control and integration
- Control mode: Bounded
- Corrective authority: in-scope fixes may be applied until done conditions pass
- Integration outcome: create one local commit after validation
- Evidence mode: Standard

## Validation
- npm run lint
- npm run typecheck
- npm test -- export-preview
```

## 2. Implementation and first validation

The active writer implements focus restoration inside the allowed component path, then runs the recorded checks.

```text
implementation
→ validation
→ fresh review
```

The checks pass, but fresh review finds that focus restoration fails when the preview closes through the Escape key.

- Finding type: implementation defect
- Correction routing: covered by current accepted authority

The review classifies coverage; it does not grant new mutation authority. T-0012 already authorizes this in-scope fix.

## 3. Correction and revalidation

The same writer corrects the Escape-key path and adds the missing regression case in the allowed test area.

```text
in-scope correction
→ affected checks rerun
→ full recorded validation
→ local commit
```

No new work order, amendment, patch artifact, or approval is created because the goal, scope, dependency policy, hard-stop decisions, external effects, host, writer, reversibility, and integration outcome remain unchanged.

## 4. Standard evidence

The final report records:

- starting and final revision;
- the reviewed Git diff;
- each check as `Passed`, `Failed`, or `Not run`;
- the single local commit;
- no external effects;
- any applicable state update, or why none was needed.

## 5. Changes that require expanded authority

The existing corrective authority does not cover:

| Proposed change | Why authority must expand |
| --- | --- |
| Add a focus-management dependency | Dependency policy changes. |
| Deploy the correction to production | Production deployment is a new gated effect. |
| Decide what preview activity the privacy policy permits | A privacy-policy decision is a hard-stop decision. |
| Modify the token editor outside the allowed paths | Scope expands. |
| Run a destructive data migration | Irreversibility and data risk change. |
| Send telemetry or notify an external service | A new external effect is introduced. |

Each proposal stops at its material boundary and follows the applicable amendment, new work order, human-input, or hard-stop route.
