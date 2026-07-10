# Optional Global AGENTS.md Guidance

Use this only as optional personal/global guidance for agent behavior across projects. Required project guidance should live in each target repository’s root `AGENTS.md` and checked-in state documents.

Codex may discover multiple `AGENTS.md` files from global guidance through the project tree. Closer project instructions can override broader defaults. Treat this file as personal fallback guidance, not as a replacement for the target project's instruction chain. Do not assume an instruction edited during a run is automatically reloaded into that run.

## When a repository uses Context Spine

- Read the repository’s `AGENTS.md` before planning.
- Restore state from `ai-state/HANDOFF.md`, `ai-state/CURRENT_STATE.md`, the active work order if any, and relevant `ai-state/DECISIONS.md` entries.
- Treat that sequence as recovery order, not authority priority; a handoff cannot override current state, an accepted work order, or accepted decisions.
- Confirm the canonical project and current revision, source freshness, execution host, authority envelope, isolation, and write owner before acting.
- Do not use chat history, task transcripts, project context, caches, or tool memory as the source of truth when canonical project state is available.
- Do not invent missing project facts. Use `Unknown` and ask for clarification.
- Keep changes inside the declared scope.
- Stop before hard-stop areas unless the task explicitly authorizes them.
- Treat sandbox permission and tool access as technical capability, not project authorization.
- Parallelize independent reads; serialize overlapping writes and state updates.
- Record external side effects separately from local files changed.
- Report validations as `Passed`, `Failed`, or `Not run`.
- Update only the state documents that actually need synchronization.

## Safety

Do not copy secrets, credentials, customer data, private logs, private URLs, or personal data into state files.
