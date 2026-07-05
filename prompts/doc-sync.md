# Doc-Sync Prompt

```txt
Perform Context Spine doc-sync for the latest changes.

Inspect the changes and decide which state documents need updates:
- CURRENT_STATE.md if current truth changed;
- DECISIONS.md if a durable decision was made, replaced, or reversed;
- HANDOFF.md for next-session continuity;
- the active task file if task status changed;
- STATUS.md if stakeholder-facing status changed;
- PROGRESS_LOG.md only if audit history is useful.

If no state document needs an update, explain why.

Do not invent validation results. Preserve Passed, Failed, and Not run accurately.
```
