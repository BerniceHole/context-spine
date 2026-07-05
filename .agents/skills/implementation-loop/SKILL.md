---
name: implementation-loop
description: Implement an accepted work order in small diffs with validation and state sync.
---


# Implementation Loop

Steps:
1. Confirm active work order.
2. Identify allowed and forbidden paths.
3. Make the smallest useful change.
4. Run relevant validation.
5. Fix failures inside scope.
6. Stop on hard-stop conflicts.
7. Prepare doc-sync.
