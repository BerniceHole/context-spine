# Handoff Report Prompt

```txt
Create or update a Context Spine continuity checkpoint only at a meaningful task, agent, surface, host, context, or automation boundary. A checkpoint records current authority but does not create, broaden, or renew it.

Do not rewrite ai-state/HANDOFF.md merely to restate the same blocker, status, or next action. Repeat a blocker only when state, authority, source freshness, evidence, or required human input changed.

Update ai-state/HANDOFF.md with:
- boundary type;
- canonical project and revision or snapshot;
- active task or run;
- current surface, execution host, isolation, and continuation method;
- current focus;
- last completed work;
- next action;
- blockers;
- authority source and status;
- active state writer or integration owner;
- pending approvals;
- human decisions needed;
- missing human input, separately from routine next action when applicable;
- validation results;
- external side effects;
- files or areas touched;
- notes for the next continuation.

If next work is blocked by missing user input, authority, or approval, make that clear.

Then produce a short final report for the human:
- work completed;
- what was verified;
- what was not verified;
- execution context, final revision, and external effects;
- what state documents changed;
- what human input is needed next, if any.
```
