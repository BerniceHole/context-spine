# Continuity Restore Prompt

Use this after a conversation, task, agent, surface, host, context, or automation boundary for a project that already has Context Spine files.

```txt
Restore this project's continuity using Context Spine.

Do not use chat history, project context, task transcripts, caches, or generated memory as the source of truth. Treat the designated canonical project state and explicitly accepted artifacts as authoritative.

Read in this order:
1. AGENTS.md
2. ai-state/HANDOFF.md
3. ai-state/CURRENT_STATE.md
4. the active work order, if one is named
5. relevant entries in ai-state/DECISIONS.md

This is recovery order, not authority priority. Use HANDOFF.md to locate the work, then verify it against CURRENT_STATE.md, the accepted work order, and accepted decisions.

Then report:
- canonical project identity and revision or snapshot;
- source freshness and any mismatch with the current working tree or external state;
- current surface, execution host, isolation, and continuation method;
- current project state;
- active task or next action;
- authority source, allowed mutations, write owner, and pending approvals;
- known blockers;
- validations last run;
- external side effects already produced;
- human decisions needed;
- contradictions or stale state you notice.

Do not start implementation until the state, revision, authority, write ownership, and next action are clear. A prior handoff records authority but does not create or renew it.
```
