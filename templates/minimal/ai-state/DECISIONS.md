# Decisions

Record durable project decisions here. Keep this file append-only.

## D-0001: Initial Context Spine setup

Date: YYYY-MM-DD
Status: Proposed | Accepted | Superseded | Rejected
Supersedes: none
Superseded by: none

### Context

The project is adopting Context Spine so work can recover canonical state across task, agent, surface, host, context, and automation boundaries instead of relying on conversation history alone.

### Decision

Use the Spine Four as the minimal starting structure:

- `AGENTS.md`
- `ai-state/CURRENT_STATE.md`
- `ai-state/DECISIONS.md`
- `ai-state/HANDOFF.md`

### Consequences

- State documents must stay short, current, and operational.
- Task authority, execution evidence, and continuity checkpoints must remain tied to the current project revision.
- Automation defaults to `Manual`; unattended work requires a task-specific authority envelope.
- A handoff records authority but does not create, broaden, or renew it.
- Optional documents should be added only when they prevent a repeated failure.
- Validation must be reported as `Passed`, `Failed`, or `Not run`.

### Alternatives considered

- Rely on chat history only.
- Add a larger memory-bank structure immediately.
