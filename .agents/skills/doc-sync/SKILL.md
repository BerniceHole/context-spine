---
name: doc-sync
description: Update Context Spine state files after meaningful project changes.
---


# Doc Sync

Decide which files need updates:

- `CURRENT_STATE.md` for current truth.
- `DECISIONS.md` for durable decisions.
- `HANDOFF.md` for continuity across task, agent, surface, host, context, or automation boundaries.
- active task file for status.
- `STATUS.md` for stakeholder visibility.
- `PROGRESS_LOG.md` only when audit history is useful.

If no state file changes, explain why.

Reconcile the canonical revision, source freshness, automation profile, write ownership, validation evidence, and external effects before updating state. Serialize state writes through the active state owner.

Do not invent validation results. Preserve `Passed`, `Failed`, and `Not run` accurately.
