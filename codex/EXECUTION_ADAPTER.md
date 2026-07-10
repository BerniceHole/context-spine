# Codex Execution Adapter

Status: Optional product adapter
Official behavior last verified: 2026-07-10

This adapter maps current Codex execution modes to Context Spine v2. It does not override canonical project state, an accepted work order, platform policy, repository rules, or human approval gates. Recheck the linked official documentation before relying on current product behavior.

## Stable Context Spine rule

Codex is an execution surface, not the authority source. Select a Codex environment only after the task contract identifies the canonical project, revision, allowed mutations, approval gates, isolation, write owner, validation, and continuity method.

## Instruction and state boundaries

Codex discovers an instruction chain from global guidance through the project root toward the current working directory, with closer instructions taking precedence. Current official documentation says the combined project-instruction limit is 32 KiB by default and that the chain is constructed once per run.

Therefore:

- keep required project rules in the target repository's `AGENTS.md` and checked-in documents;
- keep optional personal defaults in global guidance;
- do not assume that editing an instruction file changes the already constructed instruction chain for the current run;
- do not rely on local generated memory as the only source of required rules;
- start or restore work from the repository's continuity checkpoint and current tree, not from transcript alone.

A saved task keeps its transcript and recorded working directory, while Codex reads files from the current working tree. After resume, confirm the actual revision and diff before acting.

## Execution environments

In the ChatGPT desktop app's Codex experience, a task can select Local, Worktree, or Cloud. Local and Worktree run on the user's computer. A connected remote host is a separate handoff destination, not another name for Codex Cloud.

| Environment | Execution location | Context Spine default |
| --- | --- | --- |
| Local | Current project directory on the user's computer | Use for one supervised writer when modifying the active checkout is intended. Record dirty state before and after. |
| Worktree | Isolated Git worktree on the user's computer | Prefer for parallel or background write lanes. Assign non-overlapping scope and an integration owner. |
| Cloud | Configured remote cloud environment | Record checkout revision, setup assumptions, network policy, secrets boundary, and how the diff or result returns to canonical state. |
| Connected remote host | A configured host that supplies its own files, shell, credentials, tools, and policies | Record the destination host and verify the same repository and subdirectory before handoff. |

The user-facing steering surface and the execution host may differ. Record both.

## Resume, fork, and handoff are different

- **Resume:** continues a saved task transcript; it does not restore an old working tree.
- **Fork:** creates a new task lineage from a conversation; it does not create a Git branch or copy file state by itself.
- **Local/worktree handoff:** moves a task between a local checkout and an isolated worktree, subject to file-transfer behavior.
- **Host handoff:** moves task and Git state between compatible local or connected remote hosts. Current official documentation does not support Codex Cloud as the handoff destination.
- **Context Spine checkpoint:** provides the explicit state needed when native transport is unavailable, incomplete, or crosses products.

Never write only “resume the task.” Name which operation is intended, the source and destination revision, and the expected file state.

## Sandbox, approval, and project authority

Treat three boundaries separately:

1. **Sandbox:** what the process can technically access.
2. **Approval routing:** who or what reviews an approval-required action, including sandbox or network escalation and tool-specific side effects such as app or MCP mutations.
3. **Project authority:** what the current human instruction or accepted work order permits.

Automatic approval review changes the reviewer for eligible requests; it does not broaden the sandbox or the Context Spine authority envelope. Full technical access is not blanket authorization.

Before mutation, record:

```text
Canonical project and revision:
Execution environment and host:
Sandbox and network posture:
Authority source:
Writable paths and external effects:
Approval gates and reviewer:
Isolation:
Active writer and integration owner:
Validation environment:
Safe stop condition:
```

## Subagents and parallel work

Use subagents first for independent exploration, testing, triage, and summarization. For writable work:

Codex subagents inherit the parent task's sandbox, permission mode, and live runtime overrides. A custom agent may be configured more narrowly, such as read-only. Neither inheritance nor a narrower sandbox changes the project authority recorded in the work order.

Codex does not automatically place every subagent in its own worktree. When separate writable lanes are required, create separate worktree tasks or checkouts explicitly and assign their integration order.

- one active writer per artifact or state surface;
- dedicated worktrees or separate checkouts on branches for independent code lanes; a branch name alone does not isolate files;
- non-overlapping allowed paths where possible;
- explicit output contract for each agent;
- one integrator for final merge, validation, doc-sync, and `HANDOFF.md`;
- no assumption that a subagent or child thread received broader authority than its parent.

Validate the integrated tree. Passing tests in separate lanes do not prove the combined result.

## Scheduled runs

Current official documentation gives desktop scheduled tasks a local-project or worktree destination. Web scheduled tasks use uploaded or connected context and do not keep a local folder or worktree available between runs. Scheduling does not by itself add a Codex Cloud or connected-remote-host destination.

Unattended scheduled execution cannot rely on a fresh human approval being available. Before enabling writes, define the automation profile:

- durable prompt or accepted work order;
- canonical source and freshness check;
- desktop local project, desktop worktree, or web connected-context environment;
- narrow writable scope and network policy;
- overlap policy;
- retry budget and idempotency key or duplicate-prevention rule;
- stop and escalation conditions;
- evidence and run-log destination;
- state writer and first-run review plan.

Use worktrees when scheduled writes should stay isolated from unfinished local work. If a required action needs new approval and no approval channel is available, fail safely and report it.

For other non-interactive Codex execution, record its actual local, cloud, or remote environment separately; do not infer scheduled-task support from general environment support.

## Completion evidence

A Codex task is not complete merely because it produced a diff. The final report should tie evidence to the actual environment and revision:

- starting and final revision;
- branch or worktree;
- files changed;
- commands or checks run, reported as `Passed`, `Failed`, or `Not run`;
- external effects and their readbacks;
- state documents synchronized;
- pending approvals or integration work;
- exact continuation method.

## Official sources

- [Custom instructions with AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
- [Projects, chats, and tasks](https://learn.chatgpt.com/docs/projects)
- [Codex environments](https://learn.chatgpt.com/docs/environments/modes)
- [Git worktrees](https://learn.chatgpt.com/docs/environments/git-worktrees)
- [Cloud environment](https://learn.chatgpt.com/docs/environments/cloud-environment)
- [Remote connections](https://learn.chatgpt.com/docs/remote-connections)
- [Developer commands](https://learn.chatgpt.com/docs/developer-commands?surface=cli)
- [Subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents)
- [Scheduled tasks](https://learn.chatgpt.com/docs/automations)
- [Agent approvals and security](https://learn.chatgpt.com/docs/agent-approvals-security)
- [Memories](https://learn.chatgpt.com/docs/customization/memories)

Reverify this adapter when OpenAI changes instruction discovery, environment modes, resume or handoff behavior, memory, subagents, permission modes, automation, or host support.
