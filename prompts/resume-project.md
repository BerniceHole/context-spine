# Resume Project Prompt

```txt
Resume this project using Context Spine.

Do not use chat history as the source of truth. Treat repository files as the shared project state.

Read in this order:
1. AGENTS.md
2. ai-state/HANDOFF.md
3. ai-state/CURRENT_STATE.md
4. the active work order, if one is named
5. relevant entries in ai-state/DECISIONS.md

Then report:
- current project state;
- active task or next action;
- known blockers;
- validations last run;
- human decisions needed;
- contradictions or stale state you notice.

Do not start implementation until the current state and next action are clear.
```
