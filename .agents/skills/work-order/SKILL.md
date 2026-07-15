---
name: work-order
description: Convert work that crosses the Context Spine work-order gate into a bounded task and authority contract.
---


# Work Order

Use when work is broad or materially ambiguous, touches a hard-stop area, authorizes external, irreversible, or cost-bearing effects, enables unattended writes, or permits multiple writers. A multi-file change alone does not require a work order. Also use when the human explicitly requests one.

Before producing the work order, identify missing user inputs. If the task cannot be responsibly scoped without them, ask first instead of drafting the work order.

Choose the lightest sufficient control mode by material risk. If the task is Direct and the human did not request a work-order artifact, do not create one merely to label the mode; report scope, validation, and reporting expectations concisely.

For Bounded or Strict work, output a task file with goal, non-goals, scope, ambiguities, validation, done conditions, expected state impact, and the authority envelope. The envelope identifies its source, host, canonical revision, input freshness, allowed reads and mutations, external effects, gates, isolation, writer and integrator, trigger, prohibitions, and safe stop. Also include control mode, corrective authority, integration outcome, and evidence mode.

Use Standard evidence by default. Artifact-locked evidence requires a material byte-identity reason and does not replace semantic validation.

Use `Proposed` until the human or governing process accepts the work order. Use `Accepted` only when the scope and authority are approved; move to `Active` when execution begins.

Do not implement during this skill unless explicitly instructed.
