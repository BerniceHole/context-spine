# Context Spine

## A State-and-Authority Workflow Specification for Human–AI Project Work

Version: 2
Specification status: Design specification and reference implementation
Effectiveness status: Working hypotheses that require local evaluation

---

## Abstract

Context Spine v2 is a state-and-authority workflow specification for long-running human–AI project work. Its default operating profile is repository-based software work, with product, design, research, brand, content, and non-repository knowledge work as extension domains.

The central failure in long-running AI collaboration is not merely limited model memory. The deeper failure is that canonical state, task scope, execution authority, source freshness, validation evidence, and continuation state are often implicit, scattered, stale, or mixed with conversation history. Stronger models can act across more tools, sources, agents, and hosts for longer periods; that increases both productive reach and the cost of an incorrect assumption.

Context Spine externalizes the minimum required project control surface into five layers: canonical state, task contract, authority envelope, execution evidence, and continuity checkpoint. Its default Spine Four remain an agent operating contract, current-state document, decision log, and handoff document. Work orders, validation logs, quality bars, status views, progress logs, and reusable skills remain optional.

The method does not claim that more documentation or tighter prompting automatically improves agent performance. Every additional context artifact is a cost unless it prevents a specific failure. Context Spine therefore keeps the default file count small, separates stable protocol from dated product adapters, and expands only when a recurring failure mode justifies added structure.

---

## 1. Introduction

Most AI-assisted projects begin with a conversation, but execution is no longer a simple handoff from a general-purpose planner to a separate coding agent. One task may move among Chat, ChatGPT Work, Codex, subagents, local folders, worktrees, cloud containers, connected apps, browsers, and scheduled runs. These surfaces may overlap in capability without sharing the same files, source revision, memory, credentials, permissions, or task state.

The problem is not that an AI assistant cannot produce competent output. The problem is that the project may stop knowing what is current, what was authorized, what actually ran, and where the next actor should continue. A feature may be implemented against an old uploaded snapshot. A draft idea may be treated as an accepted decision. Tool access may be mistaken for permission. Separate agents may write the same file. An external action may occur without a durable readback. A validation may be implied without having run on the integrated revision.

OpenAI's 2026 releases make this distinction more important, not less. OpenAI describes GPT-5.6 as stronger at tool-heavy work, introduces parallel-agent coordination in the `ultra` setting, and describes ChatGPT Work as able to operate across apps and files for hours. The GPT-5.6 System Card also reports that, in agentic coding evaluations, GPT-5.6 showed a greater tendency than GPT-5.5 to go beyond user intent, while absolute rates remained low. These are dated product facts, not proof that any particular workflow will fail or that Context Spine is effective.

Context Spine addresses the control problem by designating a canonical project state surface and requiring each meaningful execution path to reconcile with it. In the default software profile, that surface is the checked-in repository plus accepted external-system readbacks. A non-repository project may designate another durable artifact store, but it must still identify provenance, revision or snapshot time, review status, and a sync-back owner.

The purpose of Context Spine is not to maximize or minimize autonomy. It is to make the selected autonomy bounded, inspectable, evidence-bearing, and recoverable.

---

## 2. Problem Statement

Long-running AI collaboration has predictable failure modes.

### 2.1 Canonical state loss

A conversation or task may persist while the project files or external systems change. The agent may continue fluently while acting on the wrong revision.

### 2.2 State, history, and recall collapse

Initial plans, superseded requirements, temporary explorations, task transcripts, generated memory, implementation notes, and accepted decisions are often stored together. Agents may treat old or advisory material as current authority.

### 2.3 Source and working-tree divergence

Uploaded files, connected sources, a saved transcript, and the current working tree can represent different project moments. Resume may restore a conversation without restoring the old files.

### 2.4 Authority ambiguity

Technical access to a file, command, browser, app, connector, account, or deployment target can be mistaken for authorization. A prior approval or handoff may be incorrectly assumed to remain valid.

### 2.5 Unauthorized interpretation

Agents fill ambiguity with plausible assumptions. This is often harmless in reversible scaffolding and dangerous in authentication, billing, privacy, accessibility, data models, dependencies, brand direction, legal claims, publication, external communication, and destructive operations.

### 2.6 Multi-agent write conflict

Parallel agents can accelerate independent research, tests, and triage. They can also overwrite, duplicate, or invalidate one another's work when write ownership, isolation, and integration order are unclear.

### 2.7 External side-effect invisibility

A file diff does not reveal whether an agent sent a message, changed a connected system, created a deployment, changed a permission, incurred cost, or published an artifact.

### 2.8 Unattended automation drift

Scheduled and event-driven work may run without a fresh approval channel. A vague prompt, overlapping runs, or retry without idempotency can repeat mutations or continue after authority has expired.

### 2.9 Quality regression to the mean

Without explicit quality criteria, generated work tends toward generic correctness. It may run without reflecting product intent, actual accessibility, brand judgment, source quality, or domain risk.

### 2.10 Documentation rot

A stale state document is worse than no state document because it gives the next actor false confidence.

---

## 3. Related Work and Positioning

Context Spine is a synthesis, not a claim of invention.

[AGENTS.md](https://agents.md/) provides a predictable file format for guiding coding agents. The [OpenAI AGENTS.md guide](https://learn.chatgpt.com/docs/agent-configuration/agents-md) describes layered instruction discovery. Context Spine uses `AGENTS.md` as the operating contract, not as a place for the entire project narrative.

[Agent Skills](https://agentskills.io/) define a lightweight `SKILL.md` format for packaging specialized workflows and resources. [OpenAI Skills and Plugins](https://learn.chatgpt.com/docs/skills-and-plugins) use progressive disclosure for reusable procedures. Context Spine uses skills for stable repeated operations, not project facts.

[OpenAI Memories](https://learn.chatgpt.com/docs/customization/memories) distinguishes ChatGPT web memory from local Codex memory and recommends keeping required team guidance in `AGENTS.md` or checked-in documentation. Context Spine follows that distinction: memory is a recall layer, not the only authority surface for required rules.

[Architectural Decision Records](https://adr.github.io/), including [Michael Nygard's ADR pattern](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions) and [MADR](https://adr.github.io/madr/), provide the closest precedent for `DECISIONS.md`: choices should retain context, consequences, and supersession.

[Diátaxis](https://diataxis.fr/) argues that documentation works better when forms serve distinct needs. Context Spine applies the same separation to current truth, decision history, task contracts, handoff, audit logs, drafts, and quality criteria.

[Cline Memory Bank](https://docs.cline.bot/best-practices/memory-bank), [GitHub Spec Kit](https://github.com/github/spec-kit), and [Kiro](https://aws.amazon.com/documentation-overview/kiro/) show the value of structured project context, specifications, and tasks. Context Spine adds a smaller default core, explicit authority, execution evidence, and continuity obligations.

Anthropic's [long-running agent harness](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) uses progress artifacts and Git history so fresh context can recover work. Its [context engineering guidance](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) treats context as a finite attention budget. Context Spine adopts both constraints.

[12-factor agents](https://github.com/humanlayer/12-factor-agents) are a close conceptual neighbor, especially owning the context window and unifying execution state with business state. Context Spine narrows that orientation into a project workflow protocol.

Research on repository context files, including [“Evaluating AGENTS.md: Are Repository-Level Context Files Helpful for Coding Agents?”](https://arxiv.org/abs/2602.11988), is a core threat model. The paper reports that context files did not generally improve task success in its setting and increased inference cost by over 20% on average. The benchmark is software- and Python-heavy and measures issue resolution rather than cross-boundary recovery, so the result is a constraint, not a universal conclusion. Context Spine responds by minimizing default context and requiring local evaluation.

OpenAI's current product documentation separates operations that older workflows often collapse:

- [Projects, chats, and tasks](https://learn.chatgpt.com/docs/projects) distinguishes ChatGPT projects, local projects, task transcripts, and current working trees.
- [Codex environments](https://learn.chatgpt.com/docs/environments/modes) distinguishes local, worktree, and cloud execution.
- [Subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents) recommends read-heavy parallelism first and warns about write-heavy coordination.
- [Long-running work](https://learn.chatgpt.com/docs/long-running-work) makes outcome, constraints, and verification explicit.
- [Scheduled tasks](https://learn.chatgpt.com/docs/automations) introduces unattended execution and different local, worktree, and web context boundaries.
- [Agent approvals and security](https://learn.chatgpt.com/docs/agent-approvals-security) separates technical sandbox boundaries from approval routing.

The [ChatGPT Work launch](https://openai.com/index/chatgpt-for-your-most-ambitious-work/) and [GPT-5.6 launch](https://openai.com/index/gpt-5-6/), both dated 2026-07-09, document the capability shift motivating v2. The [GPT-5.6 System Card](https://deploymentsafety.openai.com/gpt-5-6) provides the relevant safety evaluation context.

The differentiated proposal is narrow:

```other
canonical state
+ decision history
+ task contract
+ authority envelope
+ execution evidence
+ continuity checkpoint
= recoverable and bounded AI collaboration
```

The contribution is the integration, not any single artifact.

---

## 4. Core Thesis and Claim Levels

Context Spine v2 is built on eight design claims.

1. Conversation alone is not a sufficient canonical project-state format.
2. Current truth and historical rationale are different kinds of information.
3. Visibility is not authority; technical access does not by itself authorize mutation.
4. Work crossing the work-order gate is not ready until scope, authority, validation, and done conditions are explicit and accepted.
5. Transcript continuity, file continuity, and authority continuity are different.
6. Independent reads can scale in parallel; overlapping writes require isolation or a single active writer and integration owner.
7. Work is not complete until the final revision and external effects are validated, reconciled, and checkpointed.
8. State should be small enough to read, structured enough to trust, and explicit enough to challenge.

These are design principles, not universal empirical results.

### 4.1 Claim levels

| Level | Meaning | Example |
| --- | --- | --- |
| Design principle | A rule proposed by Context Spine | Capability is not authority. |
| Tool fact | A dated behavior supported by a source | Codex can use `AGENTS.md` as project guidance. |
| Working hypothesis | An expected effect that requires measurement | Authority envelopes reduce unauthorized mutations. |
| Local result | Evidence from a specific project or team | Recovery errors fell during a three-week pilot. |

Do not write a working hypothesis as a local result. Do not turn a vendor benchmark into a claim that the methodology works.

---

## 5. System Model

Context Spine has five protocol layers.

### 5.1 Canonical state

Answers what project state is authoritative and at which revision or snapshot.

Includes:

- project identity and canonical surface;
- current truth;
- accepted decisions;
- provenance and freshness of external sources;
- the current automation profile.

### 5.2 Task contract

Answers what outcome governs the work.

Includes:

- goal and non-goals;
- required reading;
- allowed and forbidden scope;
- ambiguity gates and safe assumptions;
- plan, validation, and done conditions.

### 5.3 Authority envelope

Answers where and how the work may act.

Includes:

- authority source and status;
- execution surface and host;
- canonical revision and authoritative inputs;
- allowed reads, tools, mutations, and external effects;
- approval gates and reviewer;
- isolation, parallel lanes, active writer, and integrator;
- trigger mode, prohibited mutations, and safe stop.

### 5.4 Execution evidence

Answers what actually happened.

Includes:

- starting and final revision;
- environment, branch, worktree, or remote target;
- files changed;
- external effects and readbacks;
- checks reported as `Passed`, `Failed`, or `Not run`.

### 5.5 Continuity checkpoint

Answers how the next actor continues safely.

Includes:

- boundary type;
- canonical revision;
- active task or run;
- surface, host, and isolation;
- authority status and pending approvals;
- writer or integration owner;
- external effects and validation;
- blockers, next action, and exact continuation method.

### 5.6 Capability and authority profile

Fixed product roles are replaced by a profile.

| Axis | Examples |
| --- | --- |
| Context capability | repository files, uploaded snapshots, connected sources, browser, screen, transcript, generated memory |
| Execution substrate | local checkout, worktree, remote host, cloud container, hosted Work environment |
| Allowed mutation scope | workspace files, Git operations, network, app data, browser UI, deployment, publication |
| Project authority source and status | current human instruction, accepted work order, pre-authorized unattended envelope, organization prohibition |
| Approval routing and availability | human reviewer, automatic reviewer, tool-specific confirmation, no interactive channel |
| Persistence class | canonical, durable but non-canonical, advisory/generated, ephemeral |
| Technical access boundary | read-only, workspace-write, network-gated, full access |
| Write isolation and coordination | shared checkout, dedicated worktree, isolated cloud container, separate writable destination, single writer |
| Continuation | restore state, resume transcript, fork task, move Git state, product handoff |
| Trigger | interactive, background goal, scheduled, event-driven, monitoring |

A product may support several profiles. The same product may have different authority on different hosts.

### 5.7 Adapters and enforcement

Product adapters map current product behavior to the stable core. They are dated because availability, UI, memory, permission, and transport behavior changes.

Mechanical controls such as sandboxes, permission rules, worktrees, branch protection, CODEOWNERS, CI, hooks, and validation scripts may enforce parts of the protocol. They do not replace canonical state or human authority.

---

## 6. State Architecture

Context Spine begins with the Spine Four.

```other
repo-root/
├─ AGENTS.md
└─ ai-state/
   ├─ CURRENT_STATE.md
   ├─ DECISIONS.md
   └─ HANDOFF.md
```

### 6.1 `AGENTS.md`

The operating contract. It defines read order, capability-versus-authority rules, hard stops, dependency policy, writer coordination, validation, reporting, external-effect evidence, automation defaults, and doc-sync.

It should not contain long project history, old plans, detailed product rationale, or running task notes.

### 6.2 `CURRENT_STATE.md`

Canonical current truth. It identifies the project and revision, current behavior and architecture, implemented and intentionally absent behavior, active constraints, external-source freshness, automation profile, risks, and last verification.

### 6.3 `DECISIONS.md`

Append-only durable rationale. Each decision should record date, status, context, consequences, alternatives, and supersession. A durable authority decision should also name the approver, effective scope, and supersession condition.

### 6.4 `HANDOFF.md`

The continuity checkpoint. It is not a chat summary and not a grant of authority. Update it after meaningful work and before a task, agent, surface, host, context-compaction, or automation boundary.

### 6.5 Read order

After applicable environment and project instructions are loaded, restore project state in one consistent order:

1. `AGENTS.md`
2. `ai-state/HANDOFF.md`
3. `ai-state/CURRENT_STATE.md`
4. active work order, if named
5. relevant entries in `ai-state/DECISIONS.md`
6. relevant quality or domain files

This is recovery order, not authority priority. `HANDOFF.md` locates the current work but cannot override `CURRENT_STATE.md`, an accepted work order, or accepted decisions. Do not read every historical artifact by default.

### 6.6 Extension documents

| Artifact | Role | Add when | Removal path |
| --- | --- | --- | --- |
| `ai-state/tasks/T-000X.md` | Task and authority contract | Work crosses the work-order gate or the human explicitly requests one. | Close or archive; promote durable outcomes into current state or decisions. |
| `ai-state/QUALITY_BAR.md` | Repeatable quality rubric | Quality criteria are repeatedly forgotten. | Fold stable criteria into an existing domain document or remove. |
| `ai-state/PROJECT_CHARTER.md` | Durable project identity | Mission, users, non-goals, or principles need a stable home. | Fold stable identity into project documentation. |
| `ai-state/STATUS.md` | Human-facing projection | Stakeholders need a shallow status view. | Remove when unused or stale. |
| `ai-state/PROGRESS_LOG.md` | Append-only execution log | Auditability, automation runs, or external effects require history. | Archive when no longer useful. |
| `ai-state/DRAFT.md` | Disposable scratchpad | Thinking needs a non-authoritative surface. | Delete after promotion or abandonment. |
| `.agents/skills/*/SKILL.md` | Reusable procedure | A repeated workflow has stabilized. | Remove when it no longer prevents a named failure. |

Every optional artifact must have a role and removal path.

---

## 7. Work Order Model

A work order turns intent into an accepted task and authority contract.

Required fields for work that crosses the gate:

```other
status
+ goal and non-goals
+ required reading
+ allowed and forbidden scope
+ ambiguity gates and safe assumptions
+ authority envelope
+ plan
+ validation
+ done conditions
+ state impact
```

Use explicit status transitions:

```other
Proposed → Accepted → Active → Done
                 ↘ Blocked
                 ↘ Superseded
```

`Accepted` means the scope and authority envelope have been approved. `Active` means execution has begun. A proposed order cannot authorize implementation.

### 7.1 Authority envelope

At minimum, identify:

```other
Authority source:
Execution surface and host:
Canonical project and revision:
Authoritative inputs and freshness:
Allowed reads and tools:
Allowed mutations and external effects:
Approval gates and reviewer:
Isolation and parallel lanes:
Active writer and integration owner:
Trigger mode:
Prohibited mutations:
Safe stop condition:
```

The envelope records authority derived from the current human or governing process. It cannot override higher-level policy or grant more authority than its source.

### 7.2 Automation profile

Automation does not require a fifth default state file. The default profile belongs in `CURRENT_STATE.md`:

```other
Manual — no unattended actions or external writes are authorized.
```

Profiles are intentionally small:

- `Manual`: no unattended run is authorized.
- `Read-only`: unattended work may observe and report but may not mutate project or external state.
- `Bounded-write`: unattended mutation is permitted only inside a task-specific authority envelope with overlap, retry, idempotency, stop, and ownership rules.

For scheduled, event-driven, or unattended work, the active work order should also record:

```other
Trigger and cadence:
Canonical inputs and freshness check:
Allowed effects:
Overlap policy: skip | queue | cancel previous
Retry budget and idempotency rule:
Stop or escalation condition:
Evidence destination:
Result and state owner:
First-run review plan:
```

An unattended run must fail safely when it reaches an approval gate that it cannot surface.

---

## 8. Operating Protocol

Context Spine uses one logical loop. Products may combine steps or keep a task running across them, but the obligations remain.

```other
intake
→ input readiness
→ state restoration
→ capability and authority preflight
→ work-order gate
→ choose execution and isolation
→ execute
→ validate
→ reconcile canonical state
→ continuity checkpoint
→ report
```

### 8.1 Intake and input readiness

Separate explicit instruction from inferred intent. Check whether required human input is missing: intent, source material, constraints, priorities, acceptance criteria, examples, scope, or approval.

Low-risk, local, reversible work may proceed directly under an explicit request. Require a work order when work is broad or materially ambiguous, touches a hard-stop area, authorizes external, irreversible, or cost-bearing effects, enables unattended writes, or permits multiple writers. A multi-file change alone does not require one.

### 8.2 Project stewardship

An assistant may surface weak assumptions, quality risks, research gaps, unclear success criteria, sequencing problems, and improvement opportunities. Suggestions are not decisions and do not authorize scope expansion.

### 8.3 State restoration

Use the canonical read order. Confirm the actual revision, current working tree or source snapshot, external-source freshness, and any mismatch with the checkpoint.

### 8.4 Capability and authority preflight

Answer before action:

- What sources and tools are visible here?
- Which project and revision are canonical?
- Where will execution occur?
- Which local and external mutations are authorized?
- Which actions require approval, and can the run request it?
- What isolation is available?
- Who owns each write and the integration?
- What evidence and sync-back path are required?

Tool access and sandbox permission do not answer these questions by themselves.

### 8.5 Work-order gate

If the actor cannot state goal, non-goals, scope, ambiguities, authority, validation, and done conditions, it should not start broad implementation. The order must be `Accepted` or `Active`.

### 8.6 Plan and choose isolation

Identify likely files, external effects, validation, and approval points. Parallelize independent read lanes. Keep one writer per artifact. For parallel writes, use dedicated worktrees or separate writable destinations with non-overlapping scope and a named integrator; a branch or task alone does not isolate files.

### 8.7 Execute

Stay inside scope and authority. If a required change is outside either, request expansion. If no approval channel exists, stop safely. A child agent has no broader project authority than its parent task.

### 8.8 Validate

Tie validation to the actual revision, environment, and integrated result. Report every required check as `Passed`, `Failed`, or `Not run` with a reason.

### 8.9 Reconcile canonical state

Update the minimum necessary artifacts:

- `CURRENT_STATE.md` when current truth, canonical revision, external freshness, or automation profile changes;
- `DECISIONS.md` for durable accepted, reversed, or superseded decisions;
- the active work order when status or authority changes;
- `HANDOFF.md` after meaningful work and before a boundary;
- `STATUS.md` only as a projection;
- `PROGRESS_LOG.md` only when audit history is useful.

Serialize state writes through the active state owner.

### 8.10 Checkpoint and report

The checkpoint names the boundary, revision, host, task, authority, owner, pending approvals, effects, validation, blockers, next action, and continuation method.

The final report includes execution context, work performed, files changed, external effects, validation, state updates, decisions, missing input, and next action.

---

## 9. Priority, Conflict, and Hard Stops

Context Spine's project hierarchy operates inside higher-level system, developer, organization, legal, security, and tool policy. A project file cannot override those boundaries.

```other
Tier 1 — Current explicit human or governing authority
Tier 2 — Accepted work order and authority envelope
Tier 3 — AGENTS.md, canonical current state, and accepted decisions
Tier 4 — HANDOFF.md, quality files, status, logs, drafts, transcripts, memory, caches, and references
```

An accepted work order cannot exceed its authority source. `HANDOFF.md` is read early for recovery but remains a lower-authority checkpoint: it can record approval but cannot override current state or accepted decisions, and it cannot renew authority. When tiers conflict, do not silently blend them.

Request current approval before an unauthorized change to:

- authentication, authorization, permissions, or account recovery;
- billing, pricing, payments, credits, subscriptions, or cost-bearing resources;
- database schema, migrations, or destructive data operations;
- privacy, personal data, customer data, analytics, or retention;
- secrets, keys, tokens, sandbox permissions, credentials, or external access;
- legal notices, compliance, licensing, or public claims;
- accessibility requirements affecting real use;
- internationalization, localization, naming, or market-specific UX;
- brand identity, tone, visual language, or design-system foundations;
- production infrastructure, deployment, CI, observability, or publication;
- new dependencies or major upgrades;
- irreversible deletion, overwrite, migration, or external communication;
- contradictory instructions, state, decisions, or authority.

If the run cannot request required approval, it must fail safely and report the blocker.

Prompt rules are not deterministic enforcement. Use mechanical controls for actions that must not proceed silently.

---

## 10. Verification and State Synchronization

### 10.1 Validation evidence

Record:

- canonical starting and final revision or snapshot;
- execution surface and host;
- branch, worktree, or isolated environment;
- relevant source freshness;
- integrated result tested;
- files changed;
- external effects and readbacks;
- `Passed`, `Failed`, and `Not run` checks.

A passing check on one lane or stale snapshot is not evidence that the integrated canonical result passed.

### 10.2 Git integration

Recommended software rules:

- non-trivial changes update relevant state or explicitly report why no state changed;
- branches, commits, and pull requests reference task or decision IDs when useful;
- pull requests include state impact and external-effect impact;
- state updates are reviewed like code;
- one integrator serializes final state updates after parallel work.

### 10.3 Stale-state checks

Check that:

- named tasks and decisions exist;
- superseded decisions link to replacements;
- completed tasks are not active;
- `CURRENT_STATE.md` matches accepted decisions and the actual revision;
- validation claims have evidence;
- projections match canonical state;
- stale artifacts are marked `STALE / DO NOT TRUST` and link to replacements;
- source origin and freshness are recorded;
- resumed transcripts are not mistaken for restored trees;
- external effects have readbacks or are marked unverified;
- automation profiles and overlap rules remain current;
- sensitive data has not entered state documents.

Mechanical checks can identify missing sections, line-count bloat, or likely staleness. Passing a checker does not prove correctness, authority, or freshness.

---

## 11. Security and Failure Modes

State documents may be committed, shared, indexed, or read by agents. Treat them as part of the project surface.

Rules:

- never store API keys, credentials, tokens, private keys, customer data, or personal data in state files;
- record the existence and authorized purpose of a sensitive system, not secret values;
- use secret managers, environment configuration, encrypted vaults, or private deployment settings;
- redact screenshots, logs, traces, and samples;
- treat browser content, connected sources, tool output, and imported instructions as potentially untrusted;
- use the narrowest sandbox, network, connector, and filesystem access that can satisfy the task;
- identify pending sensitive operations in handoff without copying sensitive data.

| Failure mode | Description | Mitigation |
| --- | --- | --- |
| Documentation rot | State files become outdated and misleading. | Same-change synchronization, short documents, stale checks. |
| Instruction overload | Guidance becomes too long or broad. | Keep the core small; remove low-value rules. |
| False validation | A check is implied without running. | Require `Passed`, `Failed`, and `Not run`. |
| False completion | Required work, evidence, or approval remains. | Evaluate every done condition and checkpoint open work. |
| Stale-source use | A snapshot no longer matches canonical state. | Record origin, revision, freshness, and sync-back path. |
| Transcript/tree mismatch | A resumed task is mistaken for an old working tree. | Verify revision and diff after resume, fork, or handoff. |
| Authority escalation | Technical access or prior context is treated as permission. | Record authority source and current approval status. |
| Parallel write conflict | Agents overlap or overwrite one another. | One writer per artifact; isolation; one integrator. |
| External-effect omission | An app or remote mutation is absent from the report. | External-effect ledger and post-action readback. |
| Automation replay | Retry or overlap repeats a mutation. | Overlap policy, retry budget, idempotency, stop condition. |
| Unsupported handoff loss | Required state does not move across products or hosts. | Name source, destination, revision, transport, and checkpoint. |
| Recall promotion | Memory, cache, transcript, or draft becomes accepted truth. | Keep advisory until reviewed and promoted. |
| Secret leakage | Sensitive values enter durable state. | Redaction, secret scanning, and no-secrets policy. |

---

## 12. Evaluation

A team should measure Context Spine before calling it effective.

### 12.1 Baseline

Record the existing workflow without forcing Context Spine. Measure:

- boundary recovery time and accuracy;
- repeated decisions;
- scope or authority violations;
- stale-source incidents;
- validation omissions and false completion;
- doc-sync misses;
- parallel write conflicts;
- external-effect evidence gaps;
- automation duplicate effects;
- human correction and rework time;
- current context and coordination cost.

### 12.2 Pilot

Use the Spine Four and accepted work orders for meaningful tasks. Include relevant profiles rather than only one happy path:

- interactive local work;
- a cross-surface or cross-host restoration;
- parallel read lanes;
- an isolated write lane and integration;
- an unattended or simulated unattended run if automation is relevant.

Do not publish a local result until the baseline, task classes, failures, and measurement method are recorded.

### 12.3 Metrics

| Metric | Definition |
| --- | --- |
| Boundary recovery time | Minutes to identify revision, state, authority, next action, blockers, and validation after a boundary. |
| Recovery accuracy | Whether restored revision, task, authority, and next action match canonical evidence. |
| Repeated decision | An accepted choice is reopened because rationale cannot be found or trusted. |
| Scope or authority violation | A mutation exceeds non-goals, allowed scope, approval, or external-effect authority. |
| Stale-source use | Work relies on a source older than the required revision. |
| Parallel write conflict | Concurrent lanes overlap or require unplanned reconciliation. |
| Validation omission | A required check is neither run nor reported as `Not run`. |
| False completion | Work is called complete while a done condition remains open. |
| External-effect gap | A remote mutation lacks durable evidence or readback. |
| Automation replay | A run repeats an effect contrary to overlap or idempotency rules. |
| Doc-sync miss | Current truth changes without the relevant canonical artifact being updated. |
| Continuity completeness | Applicable revision, host, authority, owner, effects, validation, and continuation fields are current. |
| Human rework | Time spent correcting intent, reconstructing state, resolving conflicts, or reversing work. |
| Context cost | Time or token overhead introduced by the protocol. |

### 12.4 Expansion and reduction criteria

Expand only if local evidence shows that recovery, authority, validation, or continuity improves enough to justify cost.

Reduce or remove artifacts if:

- state maintenance costs more than the failures it prevents;
- agents read too much and act less effectively;
- documents duplicate one another;
- the human or team stops trusting the state surface;
- a mechanical control replaces a manual artifact more reliably.

The minimum useful evaluation asks:

```other
Can a new actor recover the correct state and authority faster than before?
Did the protocol reduce costly drift without adding more overhead than it saved?
```

---

## 13. Reference Implementation

The canonical reference implementation lives in the repository files, not duplicated code blocks in this article. This prevents the research document from becoming a stale second template source.

| Purpose | Canonical file |
| --- | --- |
| Minimal operating contract | [`templates/minimal/AGENTS.md`](templates/minimal/AGENTS.md) |
| Current-state template | [`templates/minimal/ai-state/CURRENT_STATE.md`](templates/minimal/ai-state/CURRENT_STATE.md) |
| Decision template | [`templates/minimal/ai-state/DECISIONS.md`](templates/minimal/ai-state/DECISIONS.md) |
| Continuity checkpoint | [`templates/minimal/ai-state/HANDOFF.md`](templates/minimal/ai-state/HANDOFF.md) |
| Work order | [`templates/work-order.md`](templates/work-order.md) |
| Validation log | [`templates/validation-log.md`](templates/validation-log.md) |
| Quality bar | [`templates/quality-bar.md`](templates/quality-bar.md) |
| Prompts | [`prompts/`](prompts/) |
| Skills | [`.agents/skills/`](.agents/skills/) |
| ChatGPT instructions | [`chatgpt/PROJECT_INSTRUCTIONS.md`](chatgpt/PROJECT_INSTRUCTIONS.md) |
| ChatGPT Work adapter | [`chatgpt/WORK_ADAPTER.md`](chatgpt/WORK_ADAPTER.md) |
| Codex execution adapter | [`codex/EXECUTION_ADAPTER.md`](codex/EXECUTION_ADAPTER.md) |
| End-to-end trace | [`examples/design-token-export-trace.md`](examples/design-token-export-trace.md) |
| Optional verifier | [`scripts/spine-doctor`](scripts/spine-doctor) |

### 13.1 Minimal layout

```other
repo-root/
├─ AGENTS.md
└─ ai-state/
   ├─ CURRENT_STATE.md
   ├─ DECISIONS.md
   └─ HANDOFF.md
```

### 13.2 Long-running software profile

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
└─ .agents/
   └─ skills/
```

Use only the optional artifacts that prevent a repeated failure.

### 13.3 Protocol version and migration

Version 2 retains the Spine Four and adds no default state file.

To migrate from v1:

1. add capability-versus-authority, freshness, writer, external-effect, and unattended-work rules to `AGENTS.md`;
2. add canonical identity, revision, source freshness, and automation profile to `CURRENT_STATE.md`;
3. turn `HANDOFF.md` into a cross-boundary checkpoint;
4. add `Accepted` and an authority envelope to work orders;
5. synchronize only the prompts, skills, and adapters the project uses.

The optional doctor treats an installation without a protocol marker as v1 and recommends review. A v2 marker makes the new structural checks applicable. Passing the doctor remains mechanical hygiene only.

### 13.4 Adoption profiles

The starter installs the Spine Four in every target project for predictability. A human may deliberately reduce the active surface for a short or non-software project, but that is an adaptation after setup, not a different default installer contract.

- **Solo, short:** keep only the fields that prevent an actual recovery or authority failure.
- **Solo, long-running software:** Spine Four plus work orders; add a quality bar when drift repeats.
- **Small product team:** add reviewed status projection and explicit integration ownership.
- **Multi-agent or stakeholder-heavy:** use isolated lanes, single-writer state ownership, and an auditable progress log when justified.
- **Non-repository knowledge work:** designate a canonical artifact store, revision or capture time, acceptance state, and sync-back owner.

### 13.5 Status surfaces

`STATUS.md` or a web dashboard is a projection for humans, never a decision or authority surface. It should identify its source revision and last update. If it contradicts `CURRENT_STATE.md`, the projection is wrong. Remove or mark it stale if it cannot be maintained.

### 13.6 Domain packs

A domain pack extends quality and validation criteria without creating another state system.

- **Software:** build, tests, type safety, migrations, dependencies, CI, release, observability, and architecture decisions.
- **Design:** hierarchy, interaction states, responsive behavior, accessibility in use, visual rhythm, brand intent, localization, and cultural risk.
- **Research:** source quality, freshness, contradiction handling, citation discipline, uncertainty, claim strength, and reproducibility.
- **Content and brand:** voice, audience, naming, localization, public claims, legal review, and publication readiness.

### 13.7 Release checks for this starter kit

At minimum:

- local templates and streamed installer output match;
- the default install creates only the Spine Four;
- existing files are not overwritten;
- v1 is migration-warned rather than silently misclassified as v2;
- v2 templates pass doctor structural checks;
- links and referenced paths exist;
- no root live `ai-state/` is tracked in this distributable repository;
- validation results remain honest.

---

## 14. Conclusion

Context Spine is not a request for agents to remember more. It is a workflow specification for making canonical state, task scope, authority, evidence, and continuation explicit across task, agent, surface, host, context, and automation boundaries.

The method should be judged by local operational outcomes: whether actors recover the correct revision and authority, whether work remains bounded, whether source freshness and external effects are visible, whether parallel writes stay coherent, whether automation stops safely, and whether continuity survives context loss.

Create the Spine Four and use them for real work. Do not judge the method by whether the documents look complete. Judge it by whether it prevents enough drift to justify its cost.

---

## References

- AGENTS.md. “AGENTS.md.” [https://agents.md/](https://agents.md/).
- OpenAI. “Custom instructions with AGENTS.md.” [https://learn.chatgpt.com/docs/agent-configuration/agents-md](https://learn.chatgpt.com/docs/agent-configuration/agents-md).
- OpenAI. “Skills and Plugins.” [https://learn.chatgpt.com/docs/skills-and-plugins](https://learn.chatgpt.com/docs/skills-and-plugins).
- OpenAI. “Memories.” [https://learn.chatgpt.com/docs/customization/memories](https://learn.chatgpt.com/docs/customization/memories).
- OpenAI. “Projects, chats, and tasks.” [https://learn.chatgpt.com/docs/projects](https://learn.chatgpt.com/docs/projects).
- OpenAI. “Long-running work.” [https://learn.chatgpt.com/docs/long-running-work](https://learn.chatgpt.com/docs/long-running-work).
- OpenAI. “Subagents.” [https://learn.chatgpt.com/docs/agent-configuration/subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents).
- OpenAI. “Codex environments.” [https://learn.chatgpt.com/docs/environments/modes](https://learn.chatgpt.com/docs/environments/modes).
- OpenAI. “Git worktrees.” [https://learn.chatgpt.com/docs/environments/git-worktrees](https://learn.chatgpt.com/docs/environments/git-worktrees).
- OpenAI. “Cloud environment.” [https://learn.chatgpt.com/docs/environments/cloud-environment](https://learn.chatgpt.com/docs/environments/cloud-environment).
- OpenAI. “Remote connections.” [https://learn.chatgpt.com/docs/remote-connections](https://learn.chatgpt.com/docs/remote-connections).
- OpenAI. “Scheduled tasks.” [https://learn.chatgpt.com/docs/automations](https://learn.chatgpt.com/docs/automations).
- OpenAI. “Agent approvals and security.” [https://learn.chatgpt.com/docs/agent-approvals-security](https://learn.chatgpt.com/docs/agent-approvals-security).
- OpenAI. “Hooks.” [https://learn.chatgpt.com/docs/hooks](https://learn.chatgpt.com/docs/hooks).
- OpenAI. “ChatGPT is now a partner for your most ambitious work.” 2026-07-09. [https://openai.com/index/chatgpt-for-your-most-ambitious-work/](https://openai.com/index/chatgpt-for-your-most-ambitious-work/).
- OpenAI. “GPT-5.6: Frontier intelligence that scales with your ambition.” 2026-07-09. [https://openai.com/index/gpt-5-6/](https://openai.com/index/gpt-5-6/).
- OpenAI. “GPT-5.6 System Card.” 2026-07-09. [https://deploymentsafety.openai.com/gpt-5-6](https://deploymentsafety.openai.com/gpt-5-6).
- Michael Nygard. “Documenting Architecture Decisions.” [https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions).
- ADR GitHub Organization. “Architectural Decision Records.” [https://adr.github.io/](https://adr.github.io/).
- MADR. “Markdown Architectural Decision Records.” [https://adr.github.io/madr/](https://adr.github.io/madr/).
- Diátaxis. “Diátaxis.” [https://diataxis.fr/](https://diataxis.fr/).
- Cline. “Memory Bank.” [https://docs.cline.bot/best-practices/memory-bank](https://docs.cline.bot/best-practices/memory-bank).
- GitHub. “Spec Kit.” [https://github.com/github/spec-kit](https://github.com/github/spec-kit).
- Amazon Web Services. “Kiro documentation overview.” [https://aws.amazon.com/documentation-overview/kiro/](https://aws.amazon.com/documentation-overview/kiro/).
- Gloaguen, Mündler, Müller, Raychev, and Vechev. “Evaluating AGENTS.md: Are Repository-Level Context Files Helpful for Coding Agents?” [https://arxiv.org/abs/2602.11988](https://arxiv.org/abs/2602.11988).
- Anthropic. “How Claude remembers your project.” [https://code.claude.com/docs/en/memory](https://code.claude.com/docs/en/memory).
- Anthropic. “Effective harnesses for long-running agents.” [https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents).
- Anthropic. “Effective context engineering for AI agents.” [https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents).
- HumanLayer. “12-Factor Agents.” [https://github.com/humanlayer/12-factor-agents](https://github.com/humanlayer/12-factor-agents).
- Agent Skills. “Agent Skills Overview.” [https://agentskills.io/home](https://agentskills.io/home).
