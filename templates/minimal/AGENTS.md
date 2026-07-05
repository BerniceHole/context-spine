# AGENTS.md

## Purpose

This repository uses Context Spine. The repository state, not chat history, is the source of truth.

## Read order

1. `ai-state/HANDOFF.md`
2. `ai-state/CURRENT_STATE.md`
3. active task file in `ai-state/tasks/`, if provided
4. relevant entries in `ai-state/DECISIONS.md`
5. `ai-state/QUALITY_BAR.md`, if present and the task affects quality, UI, product, research, content, or brand

## Working rules

- Stay inside the task scope.
- Ask before changing hard-stop areas.
- Do not add dependencies without approval.
- Prefer small diffs.
- Do not perform opportunistic refactors unless requested.
- Do not treat draft or scratch files as source of truth.
- Do not rely on tool memory or auto-memory for required project rules.
- Do not copy secrets, credentials, customer data, private logs, private URLs, or personal data into state files.

## Hard-stop areas

Ask before changing:

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
- irreversible deletion, overwrite, or migration;
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

- Update `ai-state/HANDOFF.md` after meaningful work.
- Update `ai-state/CURRENT_STATE.md` when current truth changes.
- Append to `ai-state/DECISIONS.md` for durable decisions.
- Update the active task file when task status changes.
- If no state document changes, report why.

## Final report

Use this structure:

### Work performed

### Files changed

### Validated

Passed:
Failed:
Not run:

### State updated

### Decisions

### Needs human decision

### Next
