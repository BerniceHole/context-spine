# Doc-Sync Prompt

```txt
Perform Context Spine doc-sync for the latest changes.

First reconcile the canonical project and revision, source freshness, active work order, write ownership, validation evidence, automation profile, and external side effects. Serialize state writes through the active state owner.

Then inspect the changes and decide which state documents need updates:
- CURRENT_STATE.md if current truth changed;
- DECISIONS.md if a durable decision was made, replaced, or reversed;
- HANDOFF.md for continuity across task, agent, surface, host, context, or automation boundaries;
- the active task file if task status changed;
- STATUS.md if stakeholder-facing status changed;
- PROGRESS_LOG.md only if audit history is useful.

If no state document needs an update, explain why.

Do not invent validation results or external effects. Preserve Passed, Failed, and Not run accurately. A continuity checkpoint records authority but does not grant it.
```
