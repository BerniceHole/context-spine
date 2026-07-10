---
name: context-refresh
description: Restore project state from Context Spine files before planning or implementation.
---


# Context Refresh

Use when starting or resuming work across a task, agent, surface, host, context, or automation boundary.

Steps:
1. Read `AGENTS.md`.
2. Read `ai-state/HANDOFF.md`.
3. Read `ai-state/CURRENT_STATE.md`.
4. Read the active task file, if named.
5. Read only relevant decisions.
6. Treat the sequence as recovery order, not authority priority. Verify the handoff against current state, the accepted work order, and accepted decisions.
7. Confirm the canonical project identity and revision, source freshness, execution location, active authority envelope, and state writer.
8. Report current state, next action, blockers, pending approvals, external effects, and contradictions.

Stop if state files contradict each other in a hard-stop area, if a material revision mismatch is unexplained or unsafe to reconcile, or if required authority is missing. Otherwise report and reconcile the mismatch before execution.
