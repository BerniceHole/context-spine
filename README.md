# Context Spine

A small state protocol and starter kit for recoverable human–AI project work across ChatGPT, Codex, and coding agents.

[MIT licensed](LICENSE).

Context Spine keeps long-running AI work from dissolving into chat history. It gives the project a small, durable state surface that humans and agents can both read: current truth, decisions, handoff, scoped work, and validation.

It is not an AI memory system. It is not documentation maximalism. Start with the minimum, then add structure only when it prevents a real repeated failure.

## Quick start

Pick the fastest path.

### Install in a project

From the target project root:

```sh
curl -fsSL https://raw.githubusercontent.com/BerniceHole/context-spine/main/install.sh | bash -s -- .
```

Or pass a target path:

```sh
curl -fsSL https://raw.githubusercontent.com/BerniceHole/context-spine/main/install.sh | bash -s -- /path/to/project
```

This creates only the Spine Four and does not overwrite existing files:

```text
AGENTS.md
ai-state/CURRENT_STATE.md
ai-state/DECISIONS.md
ai-state/HANDOFF.md
```

### Ask an agent

For an existing project:

```txt
Apply Context Spine to this existing project using https://github.com/BerniceHole/context-spine.
Treat Context Spine as a small operating layer, not a replacement for the product structure, documentation architecture, design system, roadmap, information architecture, brand system, or domain model. Set up only the Spine Four. Inspect the repo first. Do not implement features. Do not copy secrets or private data. Use Unknown where evidence is missing. Report files changed and validation as Passed, Failed, or Not run.
```

For a new project:

```txt
Start this new project with Context Spine using https://github.com/BerniceHole/context-spine.
Create minimal operating state only: AGENTS.md and ai-state/CURRENT_STATE.md, DECISIONS.md, HANDOFF.md. Do not design the product structure, docs tree, roadmap, architecture, design system, brand system, information architecture, or domain model unless explicitly asked. Keep placeholders short. Do not add optional docs unless a real repeated failure justifies them. Ask before making product or architecture assumptions.
```

### Use with ChatGPT or Codex

Codex reads the target repo’s root `AGENTS.md`.

For ChatGPT Projects, paste or adapt [`chatgpt/PROJECT_INSTRUCTIONS.md`](chatgpt/PROJECT_INSTRUCTIONS.md), then use [`chatgpt/RESUME_PROMPT.md`](chatgpt/RESUME_PROMPT.md) to resume fresh sessions.

For the full rationale and research context, see [`RESEARCH.md`](RESEARCH.md).

## What applying Context Spine means

Applying Context Spine means adding a small operating layer to a project:

- agent instructions;
- current project state;
- durable decisions;
- next-session handoff.

It does not replace the target project’s product structure, documentation architecture, design system, roadmap, information architecture, brand system, or domain model.

When an agent is asked to apply Context Spine, it should inspect the target project first, install or update only the Spine Four by default, use `Unknown` where evidence is missing, and ask before making project-specific assumptions.

## Repository contents

This repository is the distributable starter kit. It does **not** track live root `ai-state/` files for itself. Reusable target-project state templates live under `templates/minimal/`.

```text
context-spine/
├─ README.md
├─ RESEARCH.md
├─ LICENSE
├─ AGENTS.md
├─ install.sh
├─ .gitignore
├─ .agents/
│  └─ skills/
├─ chatgpt/
│  ├─ PROJECT_INSTRUCTIONS.md
│  └─ RESUME_PROMPT.md
├─ codex/
│  ├─ GLOBAL_AGENTS.md
│  └─ SETUP_NOTES.md
├─ prompts/
├─ templates/
│  ├─ minimal/
│  │  ├─ AGENTS.md
│  │  └─ ai-state/
│  │     ├─ CURRENT_STATE.md
│  │     ├─ DECISIONS.md
│  │     └─ HANDOFF.md
│  ├─ work-order.md
│  ├─ validation-log.md
│  └─ quality-bar.md
├─ examples/
│  └─ design-token-export-trace.md
└─ scripts/
   └─ init-context-spine.sh
```

## The Spine Four

`AGENTS.md` is the operating contract. It tells agents how to work in the repository: read order, validation, hard stops, dependency rules, reporting, and doc-sync.

`ai-state/CURRENT_STATE.md` is current truth. It should say what the project is now, what is implemented, what is intentionally not implemented, active constraints, known risks, and last verification.

`ai-state/DECISIONS.md` is append-only rationale. It records decisions, context, consequences, alternatives, and supersession.

`ai-state/HANDOFF.md` is next-session survival. It records current focus, last completed work, next action, blockers, human decisions needed, validation, and notes for the next session.

## When to add more

Add optional documents only when they prevent a repeated failure.

```text
ai-state/tasks/T-000X.md    # broad, risky, ambiguous, or multi-file work
ai-state/QUALITY_BAR.md     # repeated quality drift
ai-state/STATUS.md          # stakeholder-facing status projection
ai-state/PROGRESS_LOG.md    # audit history or long-running recovery
ai-state/DRAFT.md           # disposable scratchpad, never source of truth
.agents/skills/*/SKILL.md   # stable repeated procedures
```

Every additional context artifact has a cost. If it does not prevent drift, ambiguity, false validation, or recovery failure, leave it out.

## Prompts

Common prompts live in [`prompts/`](prompts/):

- [`apply-context-spine.md`](prompts/apply-context-spine.md)
- [`start-new-project.md`](prompts/start-new-project.md)
- [`resume-project.md`](prompts/resume-project.md)
- [`work-order.md`](prompts/work-order.md)
- [`implementation.md`](prompts/implementation.md)
- [`doc-sync.md`](prompts/doc-sync.md)
- [`quality-review.md`](prompts/quality-review.md)
- [`handoff.md`](prompts/handoff.md)

## ChatGPT and Codex

For ChatGPT Projects, paste or adapt [`chatgpt/PROJECT_INSTRUCTIONS.md`](chatgpt/PROJECT_INSTRUCTIONS.md). Use [`chatgpt/RESUME_PROMPT.md`](chatgpt/RESUME_PROMPT.md) when opening a fresh session.

For Codex, put a project-specific `AGENTS.md` at the root of the target repository. Use [`codex/GLOBAL_AGENTS.md`](codex/GLOBAL_AGENTS.md) only for optional global defaults.

## Research article

For the full specification, research context, related work, reference implementation, and evaluation criteria, see [`RESEARCH.md`](RESEARCH.md).

## License

This repository is licensed under the MIT License. See [`LICENSE`](LICENSE).
