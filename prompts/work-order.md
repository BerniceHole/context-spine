# Work Order Creation Prompt

```txt
Convert the request into a Context Spine work order.

Before drafting, choose the lightest sufficient control mode by material risk, not file count, model capability, reasoning level, or desired thoroughness. Then identify missing user inputs. If the task cannot be responsibly scoped without them, ask first.

If the task is Direct and the human did not explicitly request a work-order artifact:
- do not produce a full work order;
- say that the task may proceed directly;
- identify relevant scope, validation, and reporting expectations concisely;
- do not create a task file merely to label the task Direct.

For a Bounded or Strict work order, include:
- status, beginning as Proposed until accepted;
- Control mode: Bounded or Strict;
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
- state documents to update if applicable.

Include the existing authority envelope with:
- authority source;
- execution surface and host;
- canonical project and revision;
- authoritative inputs and freshness;
- allowed reads, tools, mutations, and external effects;
- approval gates and reviewer;
- isolation, parallel lanes, active writer, and integration owner;
- trigger mode;
- prohibited mutations;
- safe stop condition.

Also include:
- Corrective authority: either in-scope fixes may be applied until done conditions pass, or review only with mutation requiring expanded authority;
- Integration outcome: leave a working-tree diff, create a local commit, prepare PR materials locally, explicitly authorize remote push/open/update, or explicitly gate deployment/publication;
- Evidence mode: Standard by default, or Artifact-locked with a material reason.

Preparing PR materials locally is distinct from pushing a branch or opening or updating a PR. Artifact locking proves byte identity, not semantic correctness, and does not override done conditions or validation. A review classifies authority coverage but does not grant mutation authority. No new approval is required for defects already covered by corrective authority.

If the request touches hard-stop areas, list the decisions needed before implementation.

Keep Proposed, Accepted, Active, Blocked, Done, and Superseded semantics intact. Use Accepted only after scope and authority are explicitly approved; use Active only once execution starts. Do not implement while drafting the order.
```
