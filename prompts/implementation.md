# Implementation Prompt

```txt
Implement the active work order using Context Spine.

Rules:
- Confirm that the work order is Accepted or Active; move Accepted to Active when execution begins.
- Reconfirm the canonical project and revision, source freshness, execution host, isolation, authority envelope, and active writer before changing anything.
- Treat tool access and sandbox permission as technical capability, not additional authorization.
- Stay inside the declared scope.
- Do not modify forbidden paths.
- Request current approval before changing a hard-stop area unless the accepted work order explicitly authorizes the exact change.
- If approval is unavailable, stop safely instead of assuming it.
- Prefer small diffs and simple implementation.
- Parallelize independent reads, but serialize writes to overlapping files or state surfaces.
- Do not add dependencies unless the work order explicitly allows it.
- Use this bounded correction loop: implement → validate → correct in-scope defects → revalidate → integrate.
- If validation or review finds a defect covered by current corrective authority, fix it in the same task and rerun the affected checks.
- Do not create a new work order or request another approval solely because a corrective pass is needed.
- Integrate according to the declared integration outcome.
- Require expanded authority only when a correction materially changes the goal, allowed scope, dependency policy, hard-stop decisions, external effects, execution host, writer ownership, irreversibility, integration outcome, or a canonical product or design decision.
- Do not add an approval, task file, patch artifact, or checkpoint merely because a correction occurred.
- After the same safe-stop blocker has been reported once, do not repeat the inspection or blocker report unless repository state, authority, source freshness, or human input changed.
- After repeated protocol-induced failure, review task decomposition before adding more control layers.
- Run the required validation checks.
- Record any validation that cannot be run as Not run with the reason.
- Record every external side effect and the revision or environment against which validation ran.
- Synchronize state only when canonical state, authority, meaningful task status, evidence, or continuation facts changed. Do not create status churn.

Final report must include:
- work performed;
- execution context and final revision;
- files changed;
- external effects;
- validations passed, failed, and not run;
- state documents updated;
- decisions made or needed;
- next action.
```
