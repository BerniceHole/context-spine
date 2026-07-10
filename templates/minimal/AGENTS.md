# AGENTS.md

Protocol version: 2

## Purpose

This repository uses Context Spine. The checked-in repository state and explicitly accepted project artifacts are the canonical project state. Chat history, task transcripts, project context, caches, and generated memory are recall layers unless an accepted project artifact promotes their contents.

Context Spine adds a small operating layer for canonical state, task contracts, authority, execution evidence, continuity, and agent behavior. It does not replace the target project’s product structure, documentation architecture, design system, roadmap, information architecture, brand system, or domain model.

## Read order

After applicable environment instructions and this file are loaded:

1. `ai-state/HANDOFF.md`
2. `ai-state/CURRENT_STATE.md`
3. active task file in `ai-state/tasks/`, if provided
4. relevant entries in `ai-state/DECISIONS.md`
5. `ai-state/QUALITY_BAR.md`, if present and the task affects quality, UI, product, research, content, or brand

This is recovery order, not authority priority. Use `HANDOFF.md` to locate the work, then verify it against `CURRENT_STATE.md`, the accepted work order, and accepted decisions.

## Working rules

- Confirm the canonical project identity, revision or snapshot, and source freshness before acting.
- Treat tool access, sandbox permission, and platform capability as technical access, not as project authorization.
- Stay inside the task scope.
- Require an accepted work order before implementation when work is broad or materially ambiguous, touches a hard-stop area, authorizes external, irreversible, or cost-bearing effects, enables unattended writes, or permits multiple writers. A multi-file change alone does not require one.
- Ask before changing hard-stop areas unless the current request or accepted work order explicitly authorizes the exact change.
- If approval is required and no approval channel is available, stop safely and report the blocker.
- Do not add dependencies without approval.
- Prefer small diffs.
- Do not perform opportunistic refactors unless requested.
- Do not treat draft or scratch files as source of truth.
- Do not rely on tool memory or auto-memory for required project rules.
- Parallelize independent read-only work when useful. Serialize writes to the same files or state surface.
- Give each writable artifact one active writer and name the integration owner when work is parallel.
- Record external side effects, including app, connector, browser, deployment, publication, billing, and remote-system changes.
- A handoff or continuity checkpoint records authority; it does not create, broaden, or renew authority.
- For unattended work, define the trigger, allowed effects, overlap policy, retry or idempotency rule, stop condition, and result owner before enabling writes.
- Do not copy secrets, credentials, customer data, private logs, private URLs, or personal data into state files.
- Do not redesign the target project’s docs, roadmap, architecture, design system, brand system, or domain model unless explicitly asked.
- Before preparing next operational steps, check whether required human input is missing.
- Human input may be intent, source material, constraints, preferences, priorities, research direction, acceptance criteria, scope boundary, files, examples, or a decision.
- If missing input affects hard-stop areas, scope, quality, or project identity, ask before proceeding.
- Do not turn missing input into assumptions or premature next steps.
- Surface missing input, material risks, or better sequencing when relevant.
- Do not expand scope or implement suggestions without explicit approval.

## Hard-stop areas

Request current approval before changing the following unless the exact change is already authorized. If no approval channel is available, stop safely:

- authentication, authorization, permissions, account recovery;
- billing, pricing, payments, credits, subscriptions;
- database schema, migrations, destructive data operations;
- privacy, analytics tracking, retention policy, customer data;
- secrets, keys, tokens, sandbox permissions, external access;
- legal notices, compliance, licensing, public claims;
- accessibility requirements that affect real use;
- internationalization, localization, naming, market-specific UX;
- brand identity, tone, naming, visual language, design-system foundations;
- production infrastructure, CI, deployment, observability;
- new dependencies or major dependency upgrades;
- irreversible deletion, overwrite, migration, publication, or external communication;
- contradictory instructions among user request, work order, state, and decisions.

## Validation

Run the checks relevant to the task.

Default software checks, when applicable:

```sh
npm run lint
npm run typecheck
npm test
```

Report every check as `Passed`, `Failed`, or `Not run`.

## Doc-sync

- Update `ai-state/HANDOFF.md` after meaningful work and before a task, agent, surface, host, context, or automation boundary.
- Update `ai-state/CURRENT_STATE.md` when current truth changes.
- Reconcile canonical revision, source freshness, automation profile, and external effects when they change.
- Append to `ai-state/DECISIONS.md` for durable decisions.
- Update the active task file when task status changes.
- If no state document changes, report why.

## Final report

Use this structure:

### Execution context

### Work performed

### Files changed

### External effects

### Validated

Passed:
Failed:
Not run:

### State updated

### Decisions

### Needs human input

### Next
