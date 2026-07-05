# Decisions

Record durable project decisions here. Keep this file append-only.

## D-0001: Initial Context Spine setup

Date: YYYY-MM-DD
Status: Proposed | Accepted | Superseded | Rejected
Supersedes: none
Superseded by: none

### Context

The project is adopting Context Spine so future AI sessions can recover project state from repository files instead of chat history.

### Decision

Use the Spine Four as the minimal starting structure:

- `AGENTS.md`
- `ai-state/CURRENT_STATE.md`
- `ai-state/DECISIONS.md`
- `ai-state/HANDOFF.md`

### Consequences

- State documents must stay short, current, and operational.
- Optional documents should be added only when they prevent a repeated failure.
- Validation must be reported as `Passed`, `Failed`, or `Not run`.

### Alternatives considered

- Rely on chat history only.
- Add a larger memory-bank structure immediately.
