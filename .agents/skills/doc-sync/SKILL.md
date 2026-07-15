---
name: doc-sync
description: Update Context Spine state files after meaningful project changes.
---


# Doc Sync

Update state only when current truth, decisions, task status or authority, evidence, or continuity meaningfully changes:

- `CURRENT_STATE.md` for meaningful current truth, not transient defects.
- `DECISIONS.md` for durable decisions.
- `HANDOFF.md` for a real task, agent, surface, host, context, or automation boundary.
- active task file for meaningful status, scope, authority, or correction state.
- `STATUS.md` for stakeholder visibility.
- `PROGRESS_LOG.md` only when audit history is useful.

Do not create a task file solely for transient correction state or produce repeated status-only updates. If canonical state, authority, evidence, and continuation facts are unchanged, modify no state file and explain why.

Reconcile the canonical revision, source freshness, automation profile, write ownership, validation evidence, and external effects before updating state. Serialize state writes through the active state owner.

Do not invent validation results. Preserve `Passed`, `Failed`, and `Not run` accurately.
