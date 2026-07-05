# Quality Review Prompt

```txt
Review the result against Context Spine quality criteria.

Use a fresh review posture. Do not defend the implementation.

Check:
- correctness against the work order;
- scope control;
- user experience and edge states;
- accessibility in actual use;
- visual or brand consistency, if relevant;
- localization or cultural risk, if relevant;
- source quality and claim strength, if relevant;
- validation evidence;
- state document accuracy.

Return:
- ready / needs revision / blocked / blocked by missing user input;
- reasons;
- specific required changes;
- if blocked by missing user input, the missing input and the natural question to ask;
- what should not be changed further.
```
