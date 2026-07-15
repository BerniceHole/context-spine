# T-0000: Title

## Status

Proposed | Accepted | Active | Blocked | Done | Superseded

## Goal

## Non-goals

## Must read

- `AGENTS.md`
- `ai-state/HANDOFF.md`
- `ai-state/CURRENT_STATE.md`

## Scope

Allowed:

Forbidden:

## Ambiguities

Ask before implementation if:

Safe assumptions:

## Authority envelope

Authority source:

Execution surface and host:

Canonical project and revision:

Authoritative inputs and freshness:

Allowed reads and tools:

Allowed mutations and external effects:

Approval gates and reviewer:

Isolation and parallel lanes:

Active writer and integration owner:

Trigger mode: Interactive | Background goal | Scheduled | Event-driven

Prohibited mutations:

Safe stop condition:

An accepted work order records current authority. It does not override platform policy or grant authority beyond its stated envelope.

## Control and integration

Control mode: Bounded | Strict

Corrective authority:

- [ ] In-scope fixes may be applied until done conditions pass.
- [ ] Review only; mutation requires expanded authority.

Integration outcome:

- [ ] Leave a working-tree diff.
- [ ] Create a local commit on success.
- [ ] Prepare PR materials locally.
- [ ] Push a branch or open/update a PR; explicitly authorized.
- [ ] Deployment or publication requires a separate gate.
- [ ] Deployment or publication is explicitly authorized in this order.

Preparing PR materials locally does not authorize a remote push or opening or updating a PR.

Evidence mode:

- [ ] Standard: diff, relevant checks, final revision, and external-effect report.
- [ ] Artifact-locked; material reason:

In-scope fixes remain covered only while all of the following remain materially unchanged:

- accepted goal;
- allowed paths and services;
- dependency policy;
- hard-stop decisions;
- external effects;
- execution host;
- writer ownership;
- irreversibility;
- integration outcome.

Artifact locking proves byte identity, not semantic correctness. It does not override done conditions or validation results.

## Plan

1.
2.
3.

## Validation

- `npm run lint`
- `npm run typecheck`
- `npm test`

## Done when

- implementation is complete;
- validation results are recorded;
- external effects and the final revision are recorded;
- applicable state documents are updated, or the reason no update was needed is recorded;
- a continuity checkpoint is updated when the work reaches a meaningful boundary.

## State impact

Expected updates:

- [ ] `CURRENT_STATE.md`
- [ ] `DECISIONS.md`
- [ ] `HANDOFF.md`
- [ ] task file
- [ ] none, because: ...
