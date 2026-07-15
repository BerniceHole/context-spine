---
name: implementation-loop
description: Implement an accepted work order in small diffs with validation and state sync.
---


# Implementation Loop

Steps:
1. Confirm the work order is `Accepted` or `Active`; do not implement a merely proposed order.
2. Confirm the canonical revision, source freshness, execution host, authority envelope, isolation, and active writer.
3. Move an accepted order to `Active` when execution begins.
4. Identify allowed and forbidden paths, tools, and external effects.
5. Implement the smallest useful change. Parallelize reads, but serialize overlapping writes.
6. Validate against the recorded revision and environment.
7. Correct defects covered by current corrective authority in the same task, revalidate affected checks, and integrate according to the accepted outcome. Do not create a new work order solely for an in-scope defect.
8. Require reapproval only when the goal, allowed scope, dependency policy, hard-stop decisions, external effects, execution host, writer ownership, irreversibility, integration outcome, or a canonical product or design decision materially changes.
9. Stop on hard-stop conflicts, authority gaps, stale sources, or concurrent-writer conflicts. Report an unchanged blocker once and repeat it only after relevant state, authority, source freshness, or human input changes.
10. Record external effects and update task or state documents only when meaningful facts change.
