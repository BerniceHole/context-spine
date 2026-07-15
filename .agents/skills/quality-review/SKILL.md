---
name: quality-review
description: Review output against Context Spine quality criteria and domain standards.
---


# Quality Review

Use a fresh review posture.

Check correctness, scope, authority compliance, source freshness, canonical revision, execution environment, external effects, write ownership, validation evidence, UX edge states, accessibility, visual or brand consistency, localization risk, source quality, continuity completeness, and state accuracy as relevant.

For each required finding, add:

- finding type: implementation defect, missing evidence, scope expansion, product or design decision, or hard-stop or external-effect change;
- correction routing: covered by current accepted authority, accepted amendment required, new work order required, human input required, or hard-stop approval required.

Review classifies authority coverage; it does not grant mutation authority. Route an in-scope implementation defect back into the active implementation loop when current authority covers it. `Needs revision` does not automatically require another planning cycle.

Return one of:

- ready;
- needs revision;
- blocked;
- blocked by missing user input.
- blocked by missing authority.

If blocked by missing user input, name the missing input and the natural question to ask. If blocked by missing authority, name the exact authority or approval and the safe stopping point.
