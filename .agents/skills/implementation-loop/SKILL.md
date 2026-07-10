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
5. Make the smallest useful change. Parallelize reads, but serialize overlapping writes.
6. Run relevant validation against the recorded revision and environment.
7. Fix failures inside scope.
8. Stop on hard-stop conflicts, authority gaps, stale sources, or concurrent-writer conflicts.
9. Record external effects, update the task status when appropriate, and prepare doc-sync plus a continuity checkpoint.
