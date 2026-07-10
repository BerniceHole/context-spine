# Context Spine

A small state-and-authority protocol for recoverable human–AI project work across agents, tools, execution hosts, and automation.

[MIT licensed](LICENSE).

Context Spine v2 is designed to keep long-running AI work coherent when it crosses conversations, tasks, agents, apps, local or cloud hosts, worktrees, context compaction, and unattended runs. It defines a small durable surface for canonical truth, decisions, bounded authority, execution evidence, and continuity.

It is not an AI memory system, a permissions layer, or documentation maximalism. Stronger models and longer-running agents do not remove the need to distinguish technical access from project authorization. Start with the minimum, then add structure only when it prevents a real repeated failure.

## The v2 protocol

Context Spine v2 has five layers:

| Layer | Question it answers |
| --- | --- |
| Canonical state | What project state is authoritative, at which revision or snapshot? |
| Task contract | What outcome, non-goals, scope, ambiguities, and done conditions govern this work? |
| Authority envelope | Which sources, tools, mutations, external effects, approvals, and write lanes are allowed? |
| Execution evidence | What actually changed, where did it run, and what passed, failed, or did not run? |
| Continuity checkpoint | How can the next task, agent, surface, host, or automation run continue safely? |

For the default software profile, checked-in repository files and accepted external-system readbacks are canonical. Chat history, task transcripts, project context, caches, uploaded copies, and generated memory are recall or snapshot layers until reviewed and promoted into canonical state.

Core invariants:

- capability is not authority;
- a platform approval is not automatically project approval;
- source freshness and revision must be explicit;
- implementation needs an accepted work order when it is broad or materially ambiguous, touches a hard-stop area, authorizes external, irreversible, or cost-bearing effects, enables unattended writes, or permits multiple writers; a multi-file change alone does not trigger the gate;
- independent reads may run in parallel, but overlapping writes are serialized or isolated;
- external side effects need evidence and a sync-back owner;
- a handoff records authority but does not create or renew it;
- validation is always reported as `Passed`, `Failed`, or `Not run`.

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
Apply Context Spine v2 to this existing project using https://github.com/BerniceHole/context-spine.
Treat Context Spine as a small operating layer, not a replacement for the product structure, documentation architecture, design system, roadmap, information architecture, brand system, or domain model. Set up only the Spine Four. Inspect the canonical project and current revision first. Confirm write authority. Do not implement features or perform external actions. Do not copy secrets or private data. Use Unknown where evidence is missing. Report execution context, files changed, external effects, and validation as Passed, Failed, or Not run.
```

For a new project:

```txt
Start this new project with Context Spine v2 using https://github.com/BerniceHole/context-spine.
Confirm the canonical project location and write authority. Create minimal operating state only: AGENTS.md and ai-state/CURRENT_STATE.md, DECISIONS.md, HANDOFF.md. Do not design the product structure, docs tree, roadmap, architecture, design system, brand system, information architecture, or domain model unless explicitly asked. Do not perform external actions. Keep placeholders short. Do not add optional docs unless a real repeated failure justifies them. Ask before making product or architecture assumptions.
```

### Use with ChatGPT Work or Codex

For ChatGPT projects, paste or adapt [`chatgpt/PROJECT_INSTRUCTIONS.md`](chatgpt/PROJECT_INSTRUCTIONS.md). Use [`chatgpt/RESUME_PROMPT.md`](chatgpt/RESUME_PROMPT.md) after a task, agent, surface, host, context, or automation boundary. The dated [`chatgpt/WORK_ADAPTER.md`](chatgpt/WORK_ADAPTER.md) explains current Work, project, source, memory, and scheduled-task boundaries.

Codex discovers project instructions through an `AGENTS.md` chain. Put required project guidance in the target repository and use the dated [`codex/EXECUTION_ADAPTER.md`](codex/EXECUTION_ADAPTER.md) for current local, worktree, cloud, remote-host, permission, subagent, and automation behavior.

For the full rationale and research context, see [`RESEARCH.md`](RESEARCH.md).

## What applying Context Spine means

Applying Context Spine means adding a small operating layer to a project:

- agent instructions;
- canonical current state and source revision;
- durable decisions;
- task and authority contracts when needed;
- execution evidence;
- continuity across task, agent, surface, host, context, and automation boundaries.

It does not replace the target project’s product structure, documentation architecture, design system, roadmap, information architecture, brand system, or domain model.

When an agent is asked to apply Context Spine, it should inspect the canonical target project and current revision first, install or update only the Spine Four by default, use `Unknown` where evidence is missing, and ask before making project-specific or authority assumptions.

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
│  ├─ RESUME_PROMPT.md
│  └─ WORK_ADAPTER.md
├─ codex/
│  ├─ EXECUTION_ADAPTER.md
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
   ├─ init-context-spine.sh
   └─ spine-doctor
```

## The Spine Four

`AGENTS.md` is the operating contract. It tells agents how to restore state, distinguish capability from authority, coordinate writers, validate, stop, report, and synchronize state.

`ai-state/CURRENT_STATE.md` is canonical current truth. It identifies the project and revision, current behavior, architecture, constraints, external-source freshness, automation profile, known risks, and last verification.

`ai-state/DECISIONS.md` is append-only rationale. It records decisions, context, consequences, alternatives, and supersession.

`ai-state/HANDOFF.md` is the continuity checkpoint. It records the boundary, canonical revision, active task, execution host, continuation method, current focus, authority status, write ownership, external effects, validation, and next action. It is read early for recovery but cannot override canonical current state, an accepted work order, or accepted decisions.

## Optional doctor check

`scripts/spine-doctor` can check a project using Context Spine:

```sh
python3 scripts/spine-doctor /path/to/project
```

It catches missing files, missing required sections, missing validation headings, line-count bloat, likely stale state, and v2 migration gaps. Version 1 installations remain readable and receive upgrade warnings rather than being treated as automatically invalid. The doctor is mechanical hygiene, not a replacement for human review. Passing it does not prove project correctness, current authority, or source freshness, and warnings are not proof of failure.

One-off remote use:

```sh
curl -fsSL https://raw.githubusercontent.com/BerniceHole/context-spine/main/scripts/spine-doctor | python3 - /path/to/project
```

## When to add more

Add optional documents only when they prevent a repeated failure.

```text
ai-state/tasks/T-000X.md    # work that crosses the work-order gate
ai-state/QUALITY_BAR.md     # repeated quality drift
ai-state/STATUS.md          # stakeholder-facing status projection
ai-state/PROGRESS_LOG.md    # audit history or long-running recovery
ai-state/DRAFT.md           # disposable scratchpad, never source of truth
.agents/skills/*/SKILL.md   # stable repeated procedures
```

Every additional context artifact has a cost. If it does not prevent drift, ambiguity, false validation, or recovery failure, leave it out.

Automation does not require another default file. Record the default profile in `CURRENT_STATE.md`; put task-specific trigger, effects, overlap, retry, idempotency, stop, and ownership rules in the active work order.

## Upgrading from v1

The file names and default install remain the Spine Four. To adopt v2:

1. Update `AGENTS.md` with capability-versus-authority, freshness, single-writer, external-effect, and unattended-work rules.
2. Add canonical identity, revision, source freshness, and an automation profile to `CURRENT_STATE.md`.
3. Turn `HANDOFF.md` into a continuity checkpoint tied to the active revision, execution host, authority, and write owner.
4. Add `Accepted` and an authority envelope to work that crosses the work-order gate.
5. Reconcile prompts, skills, and product adapters only when the project uses them.

Do not add new default state files merely to label the migration.

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

## Product adapters

Context Spine's core is product-independent. Product behavior belongs in dated adapters because availability, UI, permission modes, memory, and handoff behavior change over time.

- [`chatgpt/WORK_ADAPTER.md`](chatgpt/WORK_ADAPTER.md) maps Chat, Work, projects, local folders, memory, apps, subagents, and scheduled work.
- [`codex/EXECUTION_ADAPTER.md`](codex/EXECUTION_ADAPTER.md) maps instruction discovery, local/worktree/cloud/remote execution, resume/fork/handoff, permissions, subagents, and scheduled work.

OpenAI's [ChatGPT Work launch](https://openai.com/index/chatgpt-for-your-most-ambitious-work/) and [GPT-5.6 launch](https://openai.com/index/gpt-5-6/), both dated 2026-07-09, describe hours-long work across apps and files, stronger tool use, and an `ultra` setting that coordinates multiple agents in parallel. OpenAI's [GPT-5.6 System Card](https://deploymentsafety.openai.com/gpt-5-6) also reports a greater tendency than GPT-5.5 to go beyond user intent in agentic coding evaluations, while noting low absolute rates. Context Spine v2 therefore treats increased capability as a reason to make authority and evidence more explicit, not as a replacement for them.

## Research article

For the full specification, research context, related work, reference implementation, and evaluation criteria, see [`RESEARCH.md`](RESEARCH.md).

## License

This repository is licensed under the MIT License. See [`LICENSE`](LICENSE).
