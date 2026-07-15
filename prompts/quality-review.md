# Quality Review Prompt

```txt
Review the result against Context Spine quality criteria.

Use a fresh review posture. Do not defend the implementation.

Check:
- correctness against the work order;
- scope control;
- authority compliance and approval evidence;
- canonical revision, source freshness, and transcript or working-tree mismatch;
- execution environment and whether validation applies to it;
- single-writer ownership or isolated non-overlapping write lanes;
- external side effects and reversibility;
- automation trigger, overlap, retry, idempotency, and stop behavior, if relevant;
- user experience and edge states;
- accessibility in actual use;
- visual or brand consistency, if relevant;
- localization or cultural risk, if relevant;
- source quality and claim strength, if relevant;
- validation evidence;
- state document accuracy;
- continuity checkpoint completeness.

For each required finding, include:

Finding type:
- implementation defect;
- missing evidence;
- scope expansion;
- product or design decision;
- hard-stop or external-effect change.

Correction routing:
- covered by current accepted authority;
- accepted amendment required;
- new work order required;
- human input required;
- hard-stop approval required.

The review classifies authority coverage; it does not itself grant mutation authority. A verdict of needs revision does not automatically mean creating another planning cycle. Route an in-scope implementation defect back into the active implementation loop when current accepted authority already covers it.

Return:
- ready / needs revision / blocked / blocked by missing user input / blocked by missing authority;
- reasons;
- specific required changes;
- if blocked by missing user input, the missing input and the natural question to ask;
- if blocked by missing authority, the exact missing authority or approval and the safe stopping point;
- what should not be changed further.
```
