# Doc-Sync Prompt

```txt
Perform Context Spine doc-sync for the latest changes.

First reconcile the canonical project and revision, source freshness, active work order, write ownership, validation evidence, automation profile, and external side effects. Serialize state writes through the active state owner.

Then inspect the changes and decide which state documents need updates:
- CURRENT_STATE.md only if current truth meaningfully changed, not for every transient implementation defect;
- DECISIONS.md if a durable decision was made, replaced, or reversed;
- HANDOFF.md only after meaningful work or at a real task, agent, surface, host, context, or automation boundary, not for repeated unchanged turns;
- the active task file only if its status, scope, authority, or meaningful correction state changed;
- STATUS.md if stakeholder-facing status changed;
- PROGRESS_LOG.md only if audit history is useful.

Do not create a new task file solely to hold transient correction state or create repeated status-only updates. STATUS.md and PROGRESS_LOG.md remain optional. If no canonical state, authority, evidence, or continuation fact changed, modify no state document and explain that no update was needed.

Do not invent validation results or external effects. Preserve Passed, Failed, and Not run accurately. A continuity checkpoint records authority but does not grant it.
```
