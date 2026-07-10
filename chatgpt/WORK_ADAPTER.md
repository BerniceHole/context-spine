# ChatGPT Work Adapter

Status: Optional product adapter
Official behavior last verified: 2026-07-10

This adapter maps current ChatGPT surfaces to Context Spine v2. It does not override canonical project state, an accepted work order, platform policy, or human approval gates. Product behavior changes faster than the core protocol; recheck the linked official documentation before relying on a feature or permission boundary.

## Stable Context Spine rule

Choose an execution surface from the task's required sources, tools, host, isolation, and authority. Do not assign permanent planning or implementation roles to a product name.

Chat, ChatGPT Work, and Codex may all help reason, research, create artifacts, or use tools. The relevant questions are:

- Which source is canonical, and what revision or snapshot is visible here?
- Where does execution occur?
- What can this surface technically access?
- What has the human or governing process authorized?
- Who owns each write and the final integration?
- How will results and external effects return to canonical state?

## Current surface map

| Surface | Good default use | State and authority caution |
| --- | --- | --- |
| Chat | Discussion, narrow questions, steering, critique | Conversation and memory are recall layers, not canonical project state. |
| ChatGPT Work | Long-running research, analysis, and finished knowledge-work artifacts across available files, apps, and web sources | Hosted or connected sources may be snapshots. Tool and connector permissions are specific to the current task and do not imply repository or publication authority. |
| Codex | Repository work, commands, tests, diffs, and code review on a selected execution environment | Local, worktree, and cloud tasks have different files, isolation, network, and approval boundaries. See the [Codex execution adapter](../codex/EXECUTION_ADAPTER.md). |

OpenAI introduced ChatGPT Work on 2026-07-09 as an agent that can work across apps and files, remain with complex projects for hours, and create finished materials. The same launch placed Chat, Work, and Codex together in the ChatGPT desktop app. This is a capability expansion, not proof that their conversations, source snapshots, local files, or authority automatically synchronize.

## Project and source boundaries

Use these terms precisely:

- **ChatGPT project:** groups chats, uploaded files, instructions, and connected sources. It does not by itself provide direct access to a folder on the user's computer.
- **Local project:** connects tasks in the desktop app to one or more local folders.
- **Chat:** a conversation in Chat or ChatGPT Work inside or outside a ChatGPT project.
- **Task:** an outcome-specific Codex execution unit tied to its own transcript and environment context.
- **Work unit:** the product-neutral Context Spine term for one accepted outcome, whether a product calls it a chat, task, goal, or run.
- **Canonical project state:** the explicitly designated source of truth. For the default software profile, this is the checked-in repository plus accepted external-system readbacks.
- **Snapshot:** an uploaded, copied, exported, or connected representation whose revision and freshness must be recorded.

Before Work relies on a source, record:

```text
Source:
Origin:
Revision or captured at:
Freshness checked:
Canonical or advisory:
Sync-back destination:
```

If Work cannot read the canonical source directly, make the snapshot boundary explicit in the work order and continuity checkpoint.

## Memory and project context

ChatGPT web memory and local Codex memory are separate systems. OpenAI describes memory as a helpful recall layer and recommends keeping required team guidance in `AGENTS.md` or checked-in documentation.

Therefore:

- do not use memory as the only place for scope, approval, safety rules, or accepted decisions;
- do not infer that remembered context is current;
- promote a fact into canonical state only through review and doc-sync;
- re-read the current work order and state files after a meaningful boundary.

## Long-running and multi-agent work

For long-running work, put the outcome, constraints, verification, source set, approval stops, and definition of done in the task contract. Where available, `/plan` helps refine an unclear outcome and `/goal` starts Goal mode. In hosted Work on the web, put the outcome, constraints, and review criteria directly in the prompt. These controls shape or run the work unit; Context Spine preserves canonical state and authority across units and surfaces.

Use parallel agents primarily for independent reads, research, tests, triage, and summarization. For writes:

- assign one writer per artifact or connected source;
- avoid giving independent tasks write access to the same source;
- use an integration owner to reconcile outputs;
- validate the integrated result, not only each lane;
- record unresolved conflicts in `HANDOFF.md`.

## Apps, browser, and external actions

Access to an app, browser, connector, or local file is technical capability. It is not authorization to send, publish, purchase, delete, deploy, commit, push, or change external records.

Before an external action, the authority envelope should name:

- the target system and account or workspace;
- the intended mutation and whether it is reversible;
- the data that may leave the canonical project;
- the approval reviewer and timing;
- the evidence or readback required after the action;
- the owner responsible for syncing the result into canonical state.

If Work delegates to hosted subagents, those agents use the parent task's available tools. Website and connector permissions remain tool-specific. A handoff between Work and Codex must not assume that local sandbox controls, credentials, or files followed the conversation.

## Scheduled and unattended work

Scheduled tasks need an explicit automation profile in `CURRENT_STATE.md` or the active work order.

At minimum, record:

```text
Trigger and cadence:
Canonical inputs and freshness check:
Execution surface and host:
Allowed effects:
Overlap policy: skip | queue | cancel previous
Retry and idempotency rule:
Stop or escalation condition:
Run evidence destination:
Result and state owner:
First-run review plan:
```

Current OpenAI documentation distinguishes desktop schedules that can use a local project or worktree from web schedules that use uploaded or connected context without keeping a local folder or worktree available between runs. Scheduled tasks run unattended; begin with the narrowest access, test the prompt interactively, review early runs, and make the stop condition durable.

## Crossing a boundary

Create or refresh `HANDOFF.md` when work crosses any of these boundaries:

- Chat, Work, or Codex;
- ChatGPT project or local project;
- web, desktop, CLI, IDE, or mobile steering surface;
- hosted environment, local checkout, worktree, remote host, or cloud container;
- main task and subagent;
- interactive and scheduled execution;
- context compaction, fork, or a new task.

The checkpoint should include canonical revision, source freshness, active task, execution host, authority status, write owner, external effects, validation, and the exact continuation method.

## Official sources

- [ChatGPT Work launch](https://openai.com/index/chatgpt-for-your-most-ambitious-work/) — dated 2026-07-09.
- [Get started with Work](https://learn.chatgpt.com/docs/get-started-with-work)
- [Long-running work](https://learn.chatgpt.com/docs/long-running-work)
- [Projects, chats, and tasks](https://learn.chatgpt.com/docs/projects)
- [Memories](https://learn.chatgpt.com/docs/customization/memories)
- [Subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents)
- [Scheduled tasks](https://learn.chatgpt.com/docs/automations)
- [Agent approvals and security](https://learn.chatgpt.com/docs/agent-approvals-security)

Reverify this adapter when OpenAI changes product names, project or task semantics, source access, memory behavior, permission modes, automation behavior, or cross-surface handoff.
