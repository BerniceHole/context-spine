# Context Spine

## A State-Centric Workflow Specification for Human–AI Project Work

---

## Abstract

Context Spine is a state-centric workflow specification for long-running human–AI project work, with web and software development as its primary operating domain and product, design, research, brand, and content work as extension domains.

The central failure in long-running AI collaboration is not merely limited model memory. The deeper failure is that project state is often implicit, scattered, stale, or mixed with conversation history. Current decisions, superseded plans, draft ideas, validation results, implementation notes, and user intent frequently collapse into the same surface. When a new AI session begins, the agent is then asked to continue a project whose state is no longer mechanically recoverable.

Context Spine externalizes project memory into a small set of checked-in, role-specific artifacts: an agent operating contract, current-state document, decision log, handoff document, work orders, validation records, and optional reusable skills. It treats state restoration, scope control, validation, documentation synchronization, and handoff as part of the work itself.

The method does not claim that more documentation automatically improves agent performance. It assumes the opposite risk: every additional context artifact is a cost unless it prevents a specific failure. Context Spine therefore starts with a minimal core and expands only when a recurring failure mode justifies the added structure.

---

## 1. Introduction

Most AI-assisted projects begin as conversations. A human explains a goal, a general-purpose model helps plan it, and a coding agent implements parts of it. For short work, this is enough. For long-running work, the conversation becomes a weak container for state.

The problem is not that an AI assistant cannot produce competent output. The problem is that the project may stop knowing what it is. A feature may be implemented against an older assumption. A draft idea may be treated as a decision. A decision may be remembered without the reason that made it valid. A validation may be implied without having been run. A human may know the original intention, while the repository reflects a chain of agent interpretations that nobody can reconstruct quickly.

Context Spine addresses this by moving durable project context out of chat and into a repository-level operating structure. The repository becomes the shared state surface for humans, ChatGPT, Codex, coding agents, and other AI agents. Chat may still be used for discussion, planning, critique, and generation, but it is not the source of truth.

The purpose of Context Spine is not to make agents more autonomous. It is to make their autonomy bounded, inspectable, and recoverable.

---

## 2. Problem Statement

Long-running AI collaboration has several predictable failure modes.

### 2.1 Context loss

A new session rarely carries the full working memory of the old one. Summaries help, but compression often removes the reasons behind decisions. The agent may continue fluently while no longer continuing the same project.

### 2.2 State and history collapse

Initial plans, superseded requirements, temporary explorations, implementation notes, and current decisions are often stored together. Humans may infer chronology from prose. Agents may treat older text as equally authoritative.

### 2.3 User situation loss

When ChatGPT writes prompts for a coding agent, the coding agent modifies the project, and its result returns to ChatGPT, the human may remember the original intention but lose the transformation chain. Over time, the work can become a derivative of prompts rather than a controlled implementation of intent.

### 2.4 Unauthorized interpretation

Agents tend to fill ambiguity with plausible assumptions. This is often acceptable in low-risk scaffolding and dangerous in authentication, billing, privacy, accessibility, data models, dependencies, brand direction, legal claims, and public-facing product behavior.

### 2.5 Quality regression to the mean

Without explicit quality criteria, generated work tends toward generic correctness. It may run, but lack product judgment. It may look clean, but not intentional. It may mention accessibility, but not improve actual use. It may follow a design pattern without understanding why the pattern exists.

### 2.6 Documentation rot

Documentation can become another source of drift. A stale state document is worse than no state document because it gives the next session false confidence.

---

## 3. Related Work and Positioning

Context Spine is a synthesis, not a claim of invention. It stands near several existing practices and agent-tooling patterns.

[AGENTS.md](https://agents.md/) provides a predictable file format for guiding coding agents. The [OpenAI Codex AGENTS.md guide](https://developers.openai.com/codex/guides/agents-md) describes repository guidance through `AGENTS.md`, including discovery and layered project guidance. The format has also moved into broader open agent-infrastructure governance through the [Agentic AI Foundation](https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation). Context Spine uses `AGENTS.md` as the agent operating contract, not as a place to store the entire project narrative.

[Agent Skills](https://agentskills.io/) define a lightweight open `SKILL.md` format for packaging specialized knowledge, workflows, scripts, references, and templates. [OpenAI Codex Skills](https://developers.openai.com/codex/skills) support the same progressive-disclosure pattern: the agent initially sees skill metadata and loads full skill instructions only when needed. Context Spine adopts this pattern for repeatable procedures such as context refresh, work-order creation, implementation loops, doc-sync, quality review, and handoff reporting.

[OpenAI Codex Memories](https://developers.openai.com/codex/memories) are useful for local recall, but the Codex Memories documentation recommends keeping required team guidance in `AGENTS.md` or checked-in documentation. Context Spine follows that distinction: memories may help, but checked-in state documents are the shared truth.

[Claude Code memory](https://code.claude.com/docs/en/memory) provides a parallel convention through `CLAUDE.md`, `.claude/rules/*.md`, and auto memory. These files can carry persistent project context, but they are still loaded as context rather than guaranteed enforcement. Context Spine treats them as compatible instruction or recall surfaces, not replacements for checked-in state.

[Architectural Decision Records](https://adr.github.io/), including [Michael Nygard’s ADR pattern](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions) and [MADR](https://adr.github.io/madr/), provide the closest precedent for `DECISIONS.md`: important choices should record context, rationale, consequences, and supersession rather than rewrite the past.

[Diátaxis](https://diataxis.fr/) argues that documentation works better when different user needs are served by different document forms. Context Spine uses Diátaxis as an analogy rather than a direct application of its original scope: current truth, decision history, handoff, progress log, draft thinking, and quality criteria are distinct state roles.

[Cline Memory Bank](https://docs.cline.bot/best-practices/memory-bank) and related memory-bank patterns show that structured markdown files can preserve project context across stateless agent sessions. Context Spine uses the same external-memory direction, while emphasizing a smaller minimal core, explicit authority boundaries, and completion by handoff.

[GitHub Spec Kit](https://github.com/github/spec-kit) and [Kiro](https://aws.amazon.com/documentation-overview/kiro/) show the value of transforming natural-language intent into specifications, plans, and task lists before implementation. Context Spine uses work orders for similar scope control, while keeping session restoration and state synchronization as first-class obligations.

Anthropic’s [long-running agent harness](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) uses artifacts such as `claude-progress.txt` and git history so fresh context windows can recover the state of work. Its [context engineering guidance](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) also frames context as a finite attention budget that should contain the smallest useful set of high-signal tokens. Context Spine adopts the same constraint, but turns it into a repository-level state architecture.

[12-factor agents](https://github.com/humanlayer/12-factor-agents) provide a close conceptual neighbor, especially the ideas of owning the context window, unifying execution state with business state, and treating the agent as a stateless reducer. Context Spine narrows that orientation into a workflow specification built around checked-in state artifacts.

Adjacent implementations include Cursor rules, Windsurf rules and memories, Aider conventions, and long-term memory architectures such as MemGPT and Letta. Context Spine does not depend on any of them, but they reflect the same pressure to make agent context explicit, inspectable, and bounded.

Research on repository-level context files, including [“Evaluating AGENTS.md: Are Repository-Level Context Files Helpful for Coding Agents?”](https://arxiv.org/abs/2602.11988) (arXiv:2602.11988), is a core threat model for Context Spine. The paper reports that context files did not generally improve task success compared with no repository context and increased inference cost by over 20% on average. Developer-written context files showed only modest average improvement in the paper’s AGENTbench setting, while LLM-generated context files tended to reduce performance; the benchmark is software- and Python-heavy, so the result should be treated as a strong constraint rather than a universal law. Context Spine responds by requiring context to be minimal, relevant, and operationally justified.

The study measures per-task issue resolution, not cross-session state recovery. Context Spine therefore treats per-task context-file overhead as an empirical threat model, while keeping cross-session recovery benefits as a working hypothesis to be measured locally.

The differentiated claim is therefore narrow:

```other
current truth
+ decision history
+ work-order gating
+ validation evidence
+ doc-sync
+ session handoff
= recoverable AI collaboration
```

The distinctive move is not any single artifact. The distinctive move is making state restoration and state synchronization part of the definition of done.

This overlaps with Cline’s memory-bank gates, Kiro’s steering/specs/tasks, Spec Kit’s constitution/spec flow, and Anthropic’s `claude-progress.txt` handoff pattern. Context Spine’s contribution is a sharper rearticulation and integration: a checked-in minimum set, failure-based expansion, work-order gating, validation evidence, and doc-sync as part of completion.

---

## 4. Core Thesis

Context Spine is built on five claims.

First, conversation is not a durable state format.

Second, current truth and historical explanation are different kinds of information and should not share the same document role.

Third, a task is not ready for an agent until its goal, non-goals, scope, ambiguities, validation, and completion conditions are explicit.

Fourth, an AI task is not complete when output is produced. It is complete when the project state has been validated, synchronized, and handed off.

Fifth, state should be small enough to read, structured enough to trust, and explicit enough to challenge.

These are design principles, not universal empirical results. A team should measure whether they improve the local workflow before expanding the system.

---

## 5. Claim Levels

Context Spine separates four levels of claim. This distinction protects the document from sounding more certain than the evidence allows.

| **Level**          | **Meaning**                                         | **Example**                                                   |
| ------------------ | --------------------------------------------------- | ------------------------------------------------------------- |
| Design principle   | A rule proposed by Context Spine                    | One document should have one job.                             |
| Tool fact          | A behavior supported by a specific tool or standard | Codex can use `AGENTS.md` as project guidance.                |
| Working hypothesis | An expected effect that must be measured locally    | Work orders reduce scope drift.                               |
| Local result       | Evidence from a specific team or project            | New-session restoration time dropped after a four-week pilot. |

Do not write a working hypothesis as if it were a local result. That is how a useful methodology becomes expensive folklore.

---

## 6. System Model

Context Spine has three layers.

```other
Context Spine
├─ Core Protocol
│  ├─ state restoration
│  ├─ decision recording
│  ├─ work-order gating
│  ├─ validation
│  ├─ doc-sync
│  └─ handoff
│
├─ Extension Modules
│  ├─ project charter
│  ├─ quality bar
│  ├─ stakeholder status
│  ├─ progress log
│  ├─ draft space
│  └─ domain packs
│
└─ Automation Layer
   ├─ skills
   ├─ stale-state checks
   ├─ status generation
   ├─ validation scripts
   └─ release gates
```

The core protocol is tool-agnostic. It can be used with any agent that can read and update files.

The extension modules are optional. They should be added only when the team has a repeated need for the extra role.

The automation layer is not the source of truth. It helps enforce, generate, or review state, but it does not replace the state documents.

---

## 7. State Architecture

Context Spine begins with the smallest useful set of documents: the Spine Four.

```other
repo-root/
├─ AGENTS.md
└─ ai-state/
   ├─ CURRENT_STATE.md
   ├─ DECISIONS.md
   └─ HANDOFF.md
```

### 7.1 `AGENTS.md`

`AGENTS.md` is the operating contract for agents. It defines how an agent should work in the repository.

It should contain build commands, validation commands, read order, hard-stop conditions, dependency rules, reporting format, and doc-sync obligations.

It should not contain long project history, old plans, philosophical essays, detailed product rationale, broad design-system documentation, or running task notes.

A good `AGENTS.md` is closer to a build contract than a novel. Context-file studies suggest that agents often follow repository instructions; the failure mode is therefore not only ignored guidance, but also compliant over-exploration caused by low-value or overly broad context.

### 7.2 `ai-state/CURRENT_STATE.md`

`CURRENT_STATE.md` is the current truth of the project.

It answers: what the project is now, what is implemented, what is intentionally not implemented, what constraints are active, what risks are known, and what was last verified.

It should not explain the whole history. If a historical reason matters, it should link to `DECISIONS.md`.

### 7.3 `ai-state/DECISIONS.md`

`DECISIONS.md` is an append-only decision log.

Each entry should include an ID, date, status, context, decision, consequences, alternatives considered, and supersession links when relevant.

Do not edit history to make the project look cleaner. Dirty history is often the most useful part.

### 7.4 `ai-state/HANDOFF.md`

`HANDOFF.md` is the next-session survival document.

It should remain short and answer: the latest completed work, the current focus, the next action, blockers, human decisions needed, validation that passed, and validation that did not run.

`HANDOFF.md` should be updated at the end of every meaningful session.

### 7.5 Extension documents

Extension documents are not part of the default minimum. Add them only when a real failure mode appears.

| **Artifact**                  | **Role**                  | **Add when**                                                        |
| ----------------------------- | ------------------------- | ------------------------------------------------------------------- |
| `ai-state/tasks/T-000X.md`    | Work order                | Tasks are ambiguous, risky, or multi-file.                          |
| `ai-state/QUALITY_BAR.md`     | Repeatable quality rubric | Quality criteria are being forgotten or applied inconsistently.     |
| `ai-state/PROJECT_CHARTER.md` | Durable project identity  | Mission, target users, non-goals, or principles need a stable home. |
| `ai-state/STATUS.md`          | Human-facing status map   | Stakeholders need a shallow status view.                            |
| `ai-state/PROGRESS_LOG.md`    | Append-only execution log | Auditability or recovery requires a historical record.              |
| `ai-state/DRAFT.md`           | Disposable scratchpad     | Agents need a place to think without creating truth.                |
| `.agents/skills/*/SKILL.md`   | Reusable procedure        | A manual workflow has stabilized and recurs often.                  |

`DRAFT.md` is never a source of truth. It may support thinking, but it cannot authorize implementation.

---

## 8. Work Order Model

A work order turns intent into a bounded task.

A useful work order contains:

```other
goal
+ non-goals
+ required reading
+ allowed scope
+ forbidden scope
+ ambiguity gates
+ plan
+ validation
+ completion conditions
```

The most important field is often not the goal. It is the non-goals. Agents are good at making plausible expansions. Non-goals keep the blast radius visible.

A work order is required when the task may touch architecture, authentication, billing, database schema, privacy, accessibility, public claims, brand direction, data migration, dependencies, or multiple product surfaces.

A request without non-goals, scope, validation, and done conditions is not yet a work order. It is still an intention.

Example:

```other
# T-0007: Add export preview for design tokens

## Goal
Give users a preview of the token export payload before downloading it.

## Non-goals
- Do not redesign the token editor.
- Do not change the token schema.
- Do not add a new UI library.

## Scope
Allowed:
- app/export/**
- components/export-preview/**

Forbidden:
- auth/**
- billing/**
- database migrations

## Ambiguities
Ask before implementation if:
- preview should include private tokens;
- export schema must change;
- server-side generation is required.

## Validation
- npm run lint
- npm run typecheck
- npm test
- manual check at 375px width

## Done when
- preview renders the exact export payload;
- no schema change is introduced;
- validation results are recorded;
- affected state documents are updated;
- HANDOFF.md is updated.
```

---

## 9. Operating Protocol

Context Spine uses one loop.

```other
intake
→ state restoration
→ work-order gate
→ plan
→ execute
→ validate
→ doc-sync
→ handoff
→ report
```

### 9.1 Intake

Capture the user’s request. Separate explicit instruction from inferred intent.

If the request is small and low-risk, the agent may proceed with the minimal core. If the request is broad, ambiguous, or risky, it should create a work order before implementation.

### 9.2 State restoration

Read selectively in this order:

1. `AGENTS.md`
2. active work order, if any
3. `ai-state/HANDOFF.md`
4. `ai-state/CURRENT_STATE.md`
5. relevant entries in `ai-state/DECISIONS.md`
6. relevant quality or domain documents

Do not read every historical document by default. State restoration should be targeted, not ceremonial.

### 9.3 Work-order gate

If the agent cannot state the goal, non-goals, allowed scope, forbidden scope, ambiguities, validation, and completion conditions, it should not start broad implementation.

### 9.4 Plan

State the plan before making broad changes. Identify likely files, validations to run, and decisions that may need human input.

For implementation tasks, prefer small diffs and visible checkpoints.

### 9.5 Execute

Work inside the declared scope. Avoid opportunistic refactors unless the work order allows them.

If the agent discovers a necessary change outside scope, it must pause and request scope expansion.

### 9.6 Validate

Run the validations defined in the work order or `AGENTS.md`.

If a validation cannot be run, record it as **Not run** with the reason. Never report a validation as passed unless it actually ran and passed.

### 9.7 Synchronize state

Update the minimum necessary state documents.

- Update `CURRENT_STATE.md` when current truth changes.
- Append to `DECISIONS.md` when a meaningful decision is made or replaced.
- Update `HANDOFF.md` at the end of meaningful work.
- Update the task file status if a work order exists.
- Update `STATUS.md` if stakeholders need a visible change.
- Append to `PROGRESS_LOG.md` only when audit history is useful.

### 9.8 Report

The final report should include work performed, validations, state updates, decisions, human decisions needed, and next action.

---

## 10. Priority and Conflict Handling

Context Spine uses four operational tiers.

```other
Tier 1 — Immediate instruction
Current user instruction and the active work order.

Tier 2 — Operating contract
AGENTS.md and applicable repository rules.

Tier 3 — Current state
CURRENT_STATE.md and active decisions in DECISIONS.md.

Tier 4 — Reference material
QUALITY_BAR.md, domain docs, PROGRESS_LOG.md, STATUS.md, DRAFT.md, and external references.
```

When tiers conflict, the agent must not silently blend them. It must report the conflict if the decision affects a hard-stop area.

This is intentionally simpler than a fine-grained hierarchy. Current agents can be guided by instruction priority, but a long subtle hierarchy should not be treated as a reliable enforcement mechanism.

Prompt-level rules are guidance, not deterministic enforcement. For operations that must not happen accidentally, pair Context Spine with mechanical controls: permission deny lists, branch protection, CODEOWNERS, CI gates, pre-commit hooks, or tool-specific lifecycle hooks such as `PreToolUse`. The prompt should say when to stop; the environment should block what must never proceed silently.

### Hard-stop conditions

The agent must stop and ask before proceeding when a task creates or changes any of the following:

- authentication, authorization, or account recovery;
- billing, pricing, payments, credits, or subscription behavior;
- database schema, migrations, or destructive data operations;
- privacy, personal data, customer data, analytics tracking, or retention policy;
- security boundaries, secrets, keys, tokens, sandbox permissions, or external access;
- legal notices, compliance requirements, public claims, or licensing terms;
- accessibility requirements that affect real use, not just markup;
- internationalization, localization, naming, cultural interpretation, or market-specific UX;
- brand identity, tone, naming, visual language, or design-system foundations;
- production infrastructure, deployment, CI, observability, or cost-bearing resources;
- new runtime dependencies or major dependency upgrades;
- irreversible deletion, overwrite, or migration;
- contradictory instructions among user request, work order, state, and decisions.

When in doubt, stop. A good stop is cheaper than a confident repair.

For irreversible operations, a hard-stop rule should eventually become a hard gate. Prompt compliance is useful, but permission rules, hooks, CI checks, and deployment protections are the safer layer.

---

## 11. Verification and Documentation Sync

Context Spine treats verification and doc-sync as part of the task, not as aftercare.

### 11.1 Validation evidence

Report validation in three categories:

```other
## Validated
Passed:
- ...

Failed:
- ...

Not run:
- ... because ...
```

The `Not run` category is essential. It prevents implied confidence.

### 11.2 Git integration

Doc-sync should travel with the change it describes.

Recommended rules:

- Every non-trivial code change should update relevant state documents or explicitly state `No state change: <reason>` in the PR or final report.
- Work branches should include the task ID when possible: `T-0007-export-preview`.
- Commit messages should reference the task ID or decision ID when relevant.
- Pull requests should include a **State Impact** section.
- State document updates should be reviewed like code.

A lightweight PR state-impact block:

```other
## State Impact
- [ ] CURRENT_STATE.md updated
- [ ] DECISIONS.md updated
- [ ] HANDOFF.md updated
- [ ] task file updated
- [ ] No state change needed because: ...
```

### 11.3 Stale-state checks

Context Spine fails when state documents rot. Stale-state detection should start manual and become automated only after the rules stabilize.

Minimum checks:

- `HANDOFF.md` names a next action that actually exists.
- Referenced task IDs exist.
- Referenced decision IDs exist.
- Superseded decisions point to replacement decisions.
- Completed tasks are not still listed as active.
- `CURRENT_STATE.md` does not contradict the latest active decision.
- Validations reported as passed have evidence.
- `STATUS.md`, if present, matches `CURRENT_STATE.md`.
- Known stale documents or sections are marked `STALE / DO NOT TRUST` and link to their replacement.
- Sensitive data has not been copied into state documents.

The point is not to make documentation heavy. The point is to make false state visible.

---

## 12. Security, Boundaries, and Failure Modes

State documents may be committed, shared, indexed, or read by agents. Treat them as part of the project surface.

Rules:

- Never store API keys, credentials, session tokens, private keys, customer data, or personally identifiable information in state documents.
- Record the existence of sensitive systems, not the secret values.
- Use `.env`, secret managers, encrypted vaults, or private deployment settings for secrets.
- Add `ai-state/private/` to `.gitignore` if private notes are unavoidable.
- Redact screenshots, logs, stack traces, and export samples before adding them to state.
- Do not store confidential commercial terms, unreleased business metrics, or private user data unless the repository and access model are designed for that level of sensitivity.
- If an agent needs sensitive data to proceed, it must ask for a safe access method rather than requesting raw values in chat.

Known failure modes:

| **Failure mode**           | **Description**                                                           | **Mitigation**                                                                                                               |
| -------------------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Documentation rot          | State documents become outdated and mislead future agents.                | Same-PR state updates, stale-state checks, short documents.                                                                  |
| Stale truth marker missing | A known-outdated state file remains readable as if it were authoritative. | Mark the file or section `STALE / DO NOT TRUST`, link to the replacement, and prevent agents from using it as current truth. |
| Instruction overload       | Guidance files and skills become too long.                                | Keep the core small, archive details, delete low-value rules.                                                                |
| False validation           | Agent implies validation passed when it did not run.                      | Require Passed, Failed, and Not Run.                                                                                         |
| Quality self-deception     | Producer agent reviews its own qualitative work too generously.           | Use fresh-context review, second agent, or human review.                                                                     |
| Parallel write conflicts   | Multiple agents update state files at once.                               | Assign one state owner per branch or use task-level handoffs.                                                                |
| Draft promotion            | `DRAFT.md` becomes treated as approved state.                             | Mark draft as non-authoritative and never cite it as truth.                                                                  |
| Dashboard drift            | `STATUS.md` becomes a second source of truth.                             | Define it as a projection, not a decision surface.                                                                           |
| Secret leakage             | Sensitive values enter state documents.                                   | Redaction rules, secret scanning, no-secrets policy.                                                                         |

---

## 13. Evaluation Criteria

A team should measure Context Spine before calling it effective.

### 13.1 Baseline

For one week, record the current workflow without forcing Context Spine.

Measure:

- time for a new AI session to become useful;
- number of repeated decisions;
- number of scope drift incidents;
- number of validation omissions;
- number of stale or missing documentation incidents;
- number of user corrections caused by intent mismatch;
- time spent reconstructing project status.

### 13.2 Pilot

For three weeks, use the Spine Four and work orders for meaningful tasks.

Track the same metrics plus:

- doc-sync misses per week;
- tasks completed with complete handoff;
- hard-stop events caught before implementation;
- human decisions surfaced by the agent;
- average state document update time.

### 13.3 Expansion criteria

Expand only if:

- session restoration time improves enough to matter locally;
- repeated decisions decrease;
- doc-sync misses remain manageable;
- validation reporting becomes clearer;
- the team still trusts `CURRENT_STATE.md`.

Reduce scope if:

- doc-sync misses happen repeatedly;
- state updates feel heavier than the work;
- agents read too much and act less effectively;
- documents duplicate each other;
- the human stops reading the status surface.

### 13.4 Metric definitions

Use the same definitions during the baseline and the pilot. A metric is useful only if another person can record it the same way.

| **Metric**                 | **Definition**                                                                                                                     | **How to record**                                                                                                              | **Bad record**                 |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ------------------------------ |
| New-session recovery time  | Minutes from the start of a fresh AI session to a correct summary of current state, next action, blockers, and validation status.  | Start the timer when the session begins. Stop when the human accepts the summary or the agent correctly names the active task. | “Fast enough.”                 |
| Repeated decision          | A previously accepted decision is reopened because the prior rationale cannot be found or trusted.                                 | Count each reopened decision. Link the decision ID if one exists.                                                              | “We talked about this again.”  |
| Scope drift incident       | A change touches a non-goal, forbidden path, hard-stop area, or unapproved adjacent feature.                                       | Count once per task. Record the violated scope rule.                                                                           | “The agent did extra cleanup.” |
| Validation omission        | A required check was not run and was not reported as **Not run** with a reason.                                                    | Count each missing validation category per task.                                                                               | “Tests probably pass.”         |
| Doc-sync miss              | Project state changed but the relevant state document, task file, or handoff was not updated.                                      | Count per affected artifact. Record the missing file.                                                                          | “Docs need update later.”      |
| Intent mismatch correction | The human had to correct the agent because implementation followed a plausible but wrong interpretation of the request.            | Count each correction that changes scope, behavior, UX, claim, or decision.                                                    | “Minor clarification.”         |
| Hard-stop catch            | The agent identified a hard-stop area before implementation and asked for a decision.                                              | Count caught events separately from missed events.                                                                             | “Asked a question.”            |
| Handoff completeness       | The session ended with current focus, last completed work, next action, blockers, human decisions, and validation status recorded. | Mark complete only when all required handoff fields are present and current.                                                   | “Updated handoff.”             |

The minimum useful metric is simple:

```other
Can a fresh session understand the current state and next action faster than before?
```

If not, the spine is decorative.

---

## 14. Conclusion

Context Spine is not a request for agents to remember more. It is a workflow specification for making project state explicit enough that agents can reconstruct the work at every session boundary.

The method should be judged by operational outcomes: whether new sessions recover state faster, whether repeated decisions decrease, whether work remains bounded, whether validation is visible, and whether handoff survives context loss.

The specification ends here. The following section provides a reference implementation for applying Context Spine in a real repository.

---

# Reference Implementation

The following section is a reference implementation, not a requirement for every project. Use it as a starting kit, then delete, shorten, or adapt anything that does not prevent a real failure in the project at hand.

## Bootstrap Prompt

Use this prompt when introducing Context Spine to an existing repository.

```other
You are helping operate this repository with Context Spine.

Do not use chat history as the source of truth. Treat the repository as the shared project state.

Before implementation, inspect the repository and determine whether these files exist:
- AGENTS.md
- ai-state/CURRENT_STATE.md
- ai-state/DECISIONS.md
- ai-state/HANDOFF.md

If they do not exist, propose the smallest viable Context Spine setup. Do not create optional documents unless there is a clear reason.

First produce:
1. a short assessment of the repository state;
2. the minimal files you recommend creating or updating;
3. any ambiguity that requires human decision before setup.

Do not implement product features during setup unless explicitly asked.
```

## Session Resume Prompt

Use this at the start of a new AI or coding-agent session.

```other
Resume this project using Context Spine.

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
- any contradictions or stale state you notice.

Do not start implementation until the current state and next action are clear.
```

## Work Order Creation Prompt

Use this when a request is broad, risky, ambiguous, or likely to touch multiple files.

```other
Convert the request into a Context Spine work order.

The work order must include:
- goal;
- non-goals;
- must-read files;
- allowed scope;
- forbidden scope;
- ambiguities that require questions before implementation;
- safe assumptions;
- implementation plan;
- validation commands or checks;
- done conditions;
- state documents to update if the task succeeds.

If the request touches hard-stop areas, list the decisions needed before implementation.

Do not implement yet. Produce the work order first.
```

## Implementation Prompt

Use this after a work order is accepted.

```other
Implement the active work order using Context Spine.

Rules:
- Stay inside the declared scope.
- Do not modify forbidden paths.
- Ask before changing any hard-stop area.
- Prefer small diffs and simple implementation.
- Do not add dependencies unless the work order explicitly allows it.
- Run the required validation checks.
- Record any validation that cannot be run as Not run with the reason.
- Update the relevant state documents before reporting completion.

Final report must include:
- work performed;
- files changed;
- validations passed, failed, and not run;
- state documents updated;
- decisions made or needed;
- next action.
```

## Doc-Sync Prompt

Use this after code, design, research, or content changes.

```other
Perform Context Spine doc-sync for the latest changes.

Inspect the changes and decide which state documents need updates:
- CURRENT_STATE.md if current truth changed;
- DECISIONS.md if a durable decision was made, replaced, or reversed;
- HANDOFF.md for next-session continuity;
- the active task file if task status changed;
- STATUS.md if stakeholder-facing status changed;
- PROGRESS_LOG.md only if audit history is useful.

If no state document needs an update, explain why.

Do not invent validation results. Preserve Passed, Failed, and Not run accurately.
```

## Quality Review Prompt

Use this when the output has product, UI, design, accessibility, brand, research, or public-facing impact.

```other
Review the result against Context Spine quality criteria.

Use a fresh review posture. Do not defend the implementation.

Check:
- correctness against the work order;
- scope control;
- user experience and edge states;
- accessibility in actual use;
- visual or brand consistency, if relevant;
- localization or cultural risk, if relevant;
- source quality and claim strength, if relevant;
- validation evidence;
- state document accuracy.

Return:
- ready to ship / needs revision / blocked;
- reasons;
- specific required changes;
- what should not be changed further.
```

## Handoff Report Prompt

Use this at the end of a meaningful session.

```other
Create a Context Spine handoff.

Update ai-state/HANDOFF.md with:
- current focus;
- last completed work;
- next action;
- blockers;
- human decisions needed;
- validation results;
- files or areas touched;
- notes for the next session.

Then produce a short final report for the human:
- work completed;
- what was verified;
- what was not verified;
- what state documents changed;
- what decision is needed next, if any.
```

---

## Repository Layout

### Minimal layout

```other
repo-root/
├─ AGENTS.md
└─ ai-state/
   ├─ CURRENT_STATE.md
   ├─ DECISIONS.md
   └─ HANDOFF.md
```

### Recommended layout for long-running software projects

```other
repo-root/
├─ AGENTS.md
├─ ai-state/
│  ├─ CURRENT_STATE.md
│  ├─ DECISIONS.md
│  ├─ HANDOFF.md
│  ├─ QUALITY_BAR.md
│  ├─ STATUS.md
│  └─ tasks/
│     └─ T-0001.example.md
└─ .agents/
   └─ skills/
      ├─ context-refresh/
      │  └─ SKILL.md
      ├─ work-order/
      │  └─ SKILL.md
      ├─ implementation-loop/
      │  └─ SKILL.md
      ├─ doc-sync/
      │  └─ SKILL.md
      ├─ quality-review/
      │  └─ SKILL.md
      └─ handoff-report/
         └─ SKILL.md
```

### Extended layout

```other
repo-root/
├─ AGENTS.md
├─ ai-state/
│  ├─ PROJECT_CHARTER.md
│  ├─ CURRENT_STATE.md
│  ├─ DECISIONS.md
│  ├─ HANDOFF.md
│  ├─ QUALITY_BAR.md
│  ├─ STATUS.md
│  ├─ PROGRESS_LOG.md
│  ├─ DRAFT.md
│  └─ tasks/
└─ .agents/
   └─ skills/
```

Use the extended layout only when the project has recurring need for it.

---

## `AGENTS.md` Template

```other
# AGENTS.md

## Purpose
This repository uses Context Spine. The repository state, not chat history, is the source of truth.

## Read order
1. ai-state/HANDOFF.md
2. ai-state/CURRENT_STATE.md
3. active task file in ai-state/tasks/, if provided
4. relevant decisions in ai-state/DECISIONS.md
5. ai-state/QUALITY_BAR.md, if the task affects quality, UI, product, research, content, or brand

## Working rules
- Stay inside the task scope.
- Ask before changing hard-stop areas.
- Do not add dependencies without approval.
- Prefer small diffs.
- Do not perform opportunistic refactors unless requested.
- Do not treat DRAFT.md as source of truth.
- Do not rely on tool memory or auto-memory for required team rules.

## Hard-stop areas
Ask before changing:
- auth, permissions, account recovery;
- billing, pricing, payments, credits;
- database schema, migrations, destructive data operations;
- privacy, analytics tracking, retention policy;
- secrets, keys, tokens, sandbox permissions, external access;
- legal notices, compliance, licensing, public claims;
- accessibility requirements;
- internationalization, localization, naming, market-specific UX;
- brand identity, design-system foundations;
- production infrastructure, CI, deployment, observability;
- new dependencies or major dependency upgrades.

## Validation
Run the checks relevant to the task.

Default software checks:
- npm run lint
- npm run typecheck
- npm test

Report every check as Passed, Failed, or Not run.

## Doc-sync
- Update HANDOFF.md after meaningful work.
- Update CURRENT_STATE.md when current truth changes.
- Append to DECISIONS.md for durable decisions.
- Update the active task file when status changes.
- If no state document changes, report why.

## Final report
Use this structure:

### Work performed

### Files changed

### Validated
Passed:
Failed:
Not run:

### State updated

### Decisions

### Needs human decision

### Next
```

---

## `ai-state/CURRENT_STATE.md` Template

```other
# Current State

## One-line summary

## Current product behavior

## Current architecture

## Implemented

## Intentionally not implemented

## Active constraints

## Known risks

## Last verified

## Related decisions
```

---

## `ai-state/DECISIONS.md` Template

```other
# Decisions

## D-0001: Use inline export preview

Date: YYYY-MM-DD
Status: Proposed | Accepted | Superseded | Rejected
Supersedes: none
Superseded by: none

### Context

### Decision

### Consequences

### Alternatives considered
```

---

## `ai-state/HANDOFF.md` Template

```other
# Handoff

## Current focus

## Last completed

## Next action

## Blockers

## Needs human decision

## Validation
Passed:
Failed:
Not run:

## Files or areas touched

## Notes for next session
```

---

## Work Order Template

```other
# T-0000: Title

## Status
Proposed | Active | Blocked | Done | Superseded

## Goal

## Non-goals

## Must read
- AGENTS.md
- ai-state/CURRENT_STATE.md
- ai-state/HANDOFF.md

## Scope
Allowed:

Forbidden:

## Ambiguities
Ask before implementation if:

Safe assumptions:

## Plan
1.
2.
3.

## Validation
- npm run lint
- npm run typecheck
- npm test

## Done when
- implementation is complete;
- validation results are recorded;
- state documents are updated;
- handoff is updated.

## State impact
Expected updates:
- [ ] CURRENT_STATE.md
- [ ] DECISIONS.md
- [ ] HANDOFF.md
- [ ] STATUS.md
- [ ] none, because: ...
```

---

## Validation Log Template

```other
# Validation Log

Task: T-0000
Date: YYYY-MM-DD
Agent/session:
Commit/branch:

## Passed
- `npm run lint` — passed

## Failed
- `npm test` — failed: reason and failing test

## Not run
- mobile browser check — not run because local browser tool was unavailable

## Notes
- Do not infer that Not run means Passed.
```

---

## End-to-End Sample Trace

This trace shows one task moving through Context Spine from request to handoff. It is illustrative, not an additional required artifact.

### 1. User request

```other
Add a preview before users download the design token export. Keep it small. Do not change the token schema.
```

### 2. Work order excerpt

```other
# T-0007: Add export preview for design tokens

## Goal
Show the exact export payload before download.

## Non-goals
- Do not redesign the token editor.
- Do not change the token schema.
- Do not add a new UI library.

## Scope
Allowed:
- app/export/**
- components/export-preview/**

Forbidden:
- auth/**
- billing/**
- database migrations

## Validation
- npm run lint
- npm run typecheck
- npm test
- manual check at 375px width
```

### 3. Implementation report excerpt

```other
## Work performed
- Added `ExportPreviewPanel`.
- Wired preview data to the existing export payload generator.
- Preserved the existing token schema.

## Files changed
- app/export/page.tsx
- components/export-preview/ExportPreviewPanel.tsx
- components/export-preview/ExportPreviewPanel.test.tsx
```

### 4. Validation record

```other
## Validated
Passed:
- npm run lint
- npm run typecheck
- npm test

Failed:
- none

Not run:
- manual 375px browser check — local browser was unavailable in this session
```

### 5. Doc-sync result

```other
State updated:
- ai-state/CURRENT_STATE.md — export flow now includes payload preview
- ai-state/HANDOFF.md — next session should manually check 375px viewport
- ai-state/tasks/T-0007.md — status changed to Done

No DECISIONS.md entry was added because the schema and architecture did not change.
```

### 6. Handoff excerpt

```other
## Current focus
Export preview is implemented; mobile visual verification remains open.

## Last completed
T-0007 added an export payload preview without changing token schema.

## Next action
Run manual browser verification at 375px and decide whether the preview needs copy refinement.

## Validation
Passed:
- lint
- typecheck
- tests

Not run:
- 375px browser check
```

The trace is complete because the implementation, validation evidence, state update, and next-session handoff all point to the same task.

---

## Skill Specifications

Skills should be short, procedural, and trigger-specific. They should not store project facts.

`SKILL.md` is an Agent Skills open format supported across multiple agent clients. The examples below use the shared pattern; directory placement may need to adapt to the specific tool.

### `context-refresh/SKILL.md`

```other
---
name: context-refresh
description: Restore project state from Context Spine files before planning or implementation.
---

# Context Refresh

Use when starting a new session or resuming a task.

Steps:
1. Read AGENTS.md.
2. Read ai-state/HANDOFF.md.
3. Read ai-state/CURRENT_STATE.md.
4. Read the active task file, if named.
5. Read only relevant decisions.
6. Report current state, next action, blockers, and contradictions.

Stop if state files contradict each other in a hard-stop area.
```

### `work-order/SKILL.md`

```other
---
name: work-order
description: Convert a broad or risky request into a bounded Context Spine work order.
---

# Work Order

Use when a request is ambiguous, risky, multi-file, or likely to affect durable state.

Output a task file with goal, non-goals, scope, ambiguities, validation, done conditions, and expected state impact.

Do not implement during this skill unless explicitly instructed.
```

### `implementation-loop/SKILL.md`

```other
---
name: implementation-loop
description: Implement an accepted work order in small diffs with validation and state sync.
---

# Implementation Loop

Steps:
1. Confirm active work order.
2. Identify allowed and forbidden paths.
3. Make the smallest useful change.
4. Run relevant validation.
5. Fix failures inside scope.
6. Stop on hard-stop conflicts.
7. Prepare doc-sync.
```

### `doc-sync/SKILL.md`

```other
---
name: doc-sync
description: Update Context Spine state files after meaningful project changes.
---

# Doc Sync

Decide which files need updates:
- CURRENT_STATE.md for current truth.
- DECISIONS.md for durable decisions.
- HANDOFF.md for next session continuity.
- active task file for status.
- STATUS.md for stakeholder visibility.
- PROGRESS_LOG.md only when audit history is useful.

If no state file changes, explain why.
```

### `quality-review/SKILL.md`

```other
---
name: quality-review
description: Review output against Context Spine quality criteria and domain standards.
---

# Quality Review

Use a fresh review posture.

Check correctness, scope, validation evidence, UX edge states, accessibility, visual or brand consistency, localization risk, source quality, and state accuracy as relevant.

Return one of:
- ready to ship;
- needs revision;
- blocked.
```

### `handoff-report/SKILL.md`

```other
---
name: handoff-report
description: Update HANDOFF.md and produce the final human-readable report.
---

# Handoff Report

Update HANDOFF.md with current focus, last completed work, next action, blockers, human decisions, validation, files touched, and notes.

Then report work performed, validation status, state updated, decisions, human decisions needed, and next action.
```

---

## Status Surface Template

`STATUS.md` is optional. It is for humans, not agents. It should be readable in under 30 seconds.

```other
# Project Status

## One-line status

## Current milestone

## Done recently

## In progress

## Blocked

## Needs human decision

## Recent decisions

## Validation status

## Next three actions
```

A status surface should be a projection of state, not a second source of truth.

---

## Adoption Profiles

### Solo, short project

Use:

```other
AGENTS.md
ai-state/HANDOFF.md
```

Do not create the full system. For a one-off non-software task where no repository operating contract is useful, substitute this software-oriented default with the smallest explicit state surface, such as `CURRENT_STATE.md` plus `HANDOFF.md`.

### Solo, long-running software project

Use:

```other
AGENTS.md
ai-state/CURRENT_STATE.md
ai-state/DECISIONS.md
ai-state/HANDOFF.md
ai-state/tasks/
```

Add `QUALITY_BAR.md` when quality issues repeat.

### Small product team

Use:

```other
AGENTS.md
ai-state/CURRENT_STATE.md
ai-state/DECISIONS.md
ai-state/HANDOFF.md
ai-state/tasks/
ai-state/QUALITY_BAR.md
ai-state/STATUS.md
```

Review state changes in PRs.

### Multi-agent or stakeholder-heavy project

Use the extended layout, but assign state ownership clearly. Multiple agents should not freely overwrite `CURRENT_STATE.md` or `HANDOFF.md` without a merge rule.

---

## Domain Pack Sketches

### Software Pack

Add criteria for build, tests, type safety, error states, migration policy, dependency policy, CI, release, observability, and architecture decisions.

### Design Pack

Add criteria for hierarchy, interaction states, responsive behavior, accessibility in use, visual rhythm, brand intent, component coherence, localization, and cultural risk.

#### Design Pack sample

A design pack should usually extend `QUALITY_BAR.md` and work orders rather than create a parallel state system.

`ai-state/QUALITY_BAR.md` excerpt:

```other
## Design quality criteria
- The screen has a clear primary action and a visible secondary escape path.
- Empty, loading, error, disabled, and success states are specified.
- Visual hierarchy is explainable through information priority, not decoration.
- Accessibility is checked in actual use: focus order, contrast, labels, hit area, and keyboard path.
- Brand tone is present but does not obscure comprehension.
- Localization risk is reviewed for text length, naming, symbols, humor, and market-specific UX expectations.
```

Design work order excerpt:

```other
## Goal
Redesign the export preview empty state so first-time users understand why no token groups appear.

## Non-goals
- Do not redesign the export flow.
- Do not change token grouping logic.
- Do not introduce illustration unless it explains the state better than text.

## Validation
- 375px and desktop viewport review
- keyboard focus path check
- contrast check for primary and secondary text
- copy review for English and Korean length
- fresh-context design review against QUALITY_BAR.md
```

If design rationale repeatedly gets lost, record durable visual decisions in `DECISIONS.md` before adding a new design-specific state document.

### Research Pack

Add criteria for source quality, freshness, contradiction handling, citation discipline, uncertainty labels, claim strength, and reproducibility.

### Content and Brand Pack

Add criteria for voice, audience, naming, localization risk, public claims, legal review, and publication readiness.

A domain pack should be a small set of criteria, not a second methodology.

---

## Practical Starting Point

Create the Spine Four and use them for five meaningful tasks.

Do not judge the system by whether the documents look complete. Judge it by whether the next session can recover state without asking the human to reconstruct the project again.

---

## References

- AGENTS.md. “AGENTS.md.” [https://agents.md/](https://agents.md/). A shared convention for repository-level instructions for coding agents.
- OpenAI Developers. “Custom instructions with AGENTS.md.” [https://developers.openai.com/codex/guides/agents-md](https://developers.openai.com/codex/guides/agents-md). Reference for Codex repository guidance and layered instruction behavior.
- OpenAI Developers. “Agent Skills.” [https://developers.openai.com/codex/skills](https://developers.openai.com/codex/skills). Reference for `SKILL.md` packaging and progressive disclosure.
- OpenAI Developers. “Memories.” [https://developers.openai.com/codex/memories](https://developers.openai.com/codex/memories). Reference for the distinction between local recall and required checked-in team guidance.
- Michael Nygard. “Documenting Architecture Decisions.” [https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions). Precedent for recording decision context, rationale, and consequences.
- ADR GitHub Organization. “Architectural Decision Records.” [https://adr.github.io/](https://adr.github.io/). Reference hub for ADR practice.
- MADR. “Markdown Architectural Decision Records.” [https://adr.github.io/madr/](https://adr.github.io/madr/). Precedent for structured markdown decision records and supersession.
- Diátaxis. “Diátaxis.” [https://diataxis.fr/](https://diataxis.fr/). Reference for separating documentation by user need and document role.
- Cline. “Memory Bank.” [https://docs.cline.bot/best-practices/memory-bank](https://docs.cline.bot/best-practices/memory-bank). Related memory-bank pattern for preserving agent context across sessions.
- GitHub. “Spec Kit.” [https://github.com/github/spec-kit](https://github.com/github/spec-kit). Related spec-driven workflow for moving from natural-language intent to plans and tasks.
- Amazon Web Services. “Kiro documentation overview.” [https://aws.amazon.com/documentation-overview/kiro/](https://aws.amazon.com/documentation-overview/kiro/). Related agentic development workflow for specs, steering, and task execution.
- Gloaguen, Mündler, Müller, Raychev, and Vechev. “Evaluating AGENTS.md: Are Repository-Level Context Files Helpful for Coding Agents?” [https://arxiv.org/abs/2602.11988](https://arxiv.org/abs/2602.11988). Finds that repository-level context files do not generally improve task success and increase inference cost by over 20% on average; the authors recommend that human-written context files describe only minimal requirements.
- Anthropic. “How Claude remembers your project.” [https://code.claude.com/docs/en/memory](https://code.claude.com/docs/en/memory). Reference for `CLAUDE.md`, `.claude/rules/`, auto memory, and the difference between loaded context and enforced policy.
- Anthropic. “Effective harnesses for long-running agents.” [https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents). Related long-running agent pattern using session artifacts such as `claude-progress.txt` and git history.
- Anthropic. “Effective context engineering for AI agents.” [https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents). Reference for treating context as a finite attention budget and selecting high-signal tokens.
- HumanLayer. “12-Factor Agents.” [https://github.com/humanlayer/12-factor-agents](https://github.com/humanlayer/12-factor-agents). Related agent design principles for owning the context window, unifying execution state and business state, and stateless reduction.
- Agent Skills. “Agent Skills Overview.” [https://agentskills.io/home](https://agentskills.io/home). Reference for the open `SKILL.md` format and cross-client skill packaging.
- Linux Foundation. “Linux Foundation Announces the Formation of the Agentic AI Foundation.” [https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation](https://www.linuxfoundation.org/press/linux-foundation-announces-the-formation-of-the-agentic-ai-foundation). Governance context for AGENTS.md, MCP, goose, and the Agentic AI Foundation.
- Anthropic. “Automate actions with hooks.” [https://code.claude.com/docs/en/hooks-guide](https://code.claude.com/docs/en/hooks-guide). Reference for using lifecycle hooks as deterministic automation around agent behavior.
- Anthropic. “Configure permissions.” [https://code.claude.com/docs/en/permissions](https://code.claude.com/docs/en/permissions). Reference for permission rules and `PreToolUse` hooks that can deny, prompt, or block tool calls.
