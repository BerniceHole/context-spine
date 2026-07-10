---
name: quality-review
description: Review output against Context Spine quality criteria and domain standards.
---


# Quality Review

Use a fresh review posture.

Check correctness, scope, authority compliance, source freshness, canonical revision, execution environment, external effects, write ownership, validation evidence, UX edge states, accessibility, visual or brand consistency, localization risk, source quality, continuity completeness, and state accuracy as relevant.

Return one of:

- ready;
- needs revision;
- blocked;
- blocked by missing user input.
- blocked by missing authority.

If blocked by missing user input, name the missing input and the natural question to ask. If blocked by missing authority, name the exact authority or approval and the safe stopping point.
