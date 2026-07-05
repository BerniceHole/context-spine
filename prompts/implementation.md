# Implementation Prompt

```txt
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
