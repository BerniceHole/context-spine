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
- Run the required validation checks.
- Record any validation that cannot be run as Not run with the reason.
- Record every external side effect and the revision or environment against which validation ran.
- Update the relevant state documents before reporting completion.

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
