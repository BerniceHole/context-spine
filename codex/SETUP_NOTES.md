# Codex Setup Notes

Current Codex execution behavior is documented in [`EXECUTION_ADAPTER.md`](EXECUTION_ADAPTER.md). The adapter is dated because product surfaces and permission semantics can change.

For a target repository:

1. Copy `templates/minimal/AGENTS.md` to the target repository root as `AGENTS.md`.
2. Copy the three state templates from `templates/minimal/ai-state/` into the target repository’s `ai-state/` directory.
3. Start Codex from the target repository root.
4. Confirm the actual repository revision, dirty state, execution environment, sandbox, authority envelope, and active writer before implementation.
5. Keep project-specific instructions in the target repository, not in this starter kit.

Codex tasks may run in a local checkout, an isolated worktree, a configured cloud environment, or a connected remote host. Record the user-facing surface and the execution host separately. A resumed task preserves its transcript, but Codex reads the current working tree; verify the revision after resuming.

Optional:

- Copy `.agents/skills/` into the target repository when those procedures prevent a repeated failure.
- Use `codex/GLOBAL_AGENTS.md` as a personal/global default only if it helps your broader workflow.
