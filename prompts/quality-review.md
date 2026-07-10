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

Return:
- ready / needs revision / blocked / blocked by missing user input / blocked by missing authority;
- reasons;
- specific required changes;
- if blocked by missing user input, the missing input and the natural question to ask;
- if blocked by missing authority, the exact missing authority or approval and the safe stopping point;
- what should not be changed further.
```
