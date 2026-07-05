# Optional Global AGENTS.md Guidance

Use this only as optional personal/global guidance for agent behavior across projects. Required project guidance should live in each target repository’s root `AGENTS.md` and checked-in state documents.

## When a repository uses Context Spine

- Read the repository’s `AGENTS.md` before planning.
- Restore state from `ai-state/HANDOFF.md`, `ai-state/CURRENT_STATE.md`, the active work order if any, and relevant `ai-state/DECISIONS.md` entries.
- Do not use chat history or tool memory as the source of truth when repository state is available.
- Do not invent missing project facts. Use `Unknown` and ask for clarification.
- Keep changes inside the declared scope.
- Stop before hard-stop areas unless the task explicitly authorizes them.
- Report validations as `Passed`, `Failed`, or `Not run`.
- Update only the state documents that actually need synchronization.

## Safety

Do not copy secrets, credentials, customer data, private logs, private URLs, or personal data into state files.
