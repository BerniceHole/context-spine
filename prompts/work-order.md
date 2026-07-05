# Work Order Creation Prompt

```txt
Convert the request into a Context Spine work order.

Before producing the work order, identify missing user inputs. If the task cannot be responsibly scoped without them, ask first instead of drafting the work order.

The work order must include:
- goal;
- non-goals;
- must-read files;
- allowed scope;
- forbidden scope;
- ambiguities that require questions before implementation;
- safe assumptions;
- implementation plan;
- validation commands or checks;
- done conditions;
- state documents to update if the task succeeds.

If the request touches hard-stop areas, list the decisions needed before implementation.

Do not implement yet. Produce the work order first.
```
