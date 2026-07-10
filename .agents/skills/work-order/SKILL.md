---
name: work-order
description: Convert work that crosses the Context Spine work-order gate into a bounded task and authority contract.
---


# Work Order

Use when work is broad or materially ambiguous, touches a hard-stop area, authorizes external, irreversible, or cost-bearing effects, enables unattended writes, or permits multiple writers. A multi-file change alone does not require a work order. Also use when the human explicitly requests one.

Before producing the work order, identify missing user inputs. If the task cannot be responsibly scoped without them, ask first instead of drafting the work order.

Output a task file with goal, non-goals, scope, ambiguities, validation, done conditions, expected state impact, and an authority envelope.

The authority envelope must identify its source, execution surface and host, canonical revision, authoritative inputs and freshness, allowed reads and mutations, external effects, approval gates, isolation, active writer, trigger mode, prohibited mutations, and safe stop condition.

Use `Proposed` until the human or governing process accepts the work order. Use `Accepted` only when the scope and authority are approved; move to `Active` when execution begins.

Do not implement during this skill unless explicitly instructed.
