# Work Order Creation Prompt

```txt
Convert the request into a Context Spine work order.

Before producing the work order, identify missing user inputs. If the task cannot be responsibly scoped without them, ask first instead of drafting the work order.

The work order must include:
- status, beginning as Proposed until accepted;
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

It must also include an authority envelope with:
- authority source;
- execution surface and host;
- canonical project and revision;
- authoritative inputs and freshness;
- allowed reads, tools, mutations, and external effects;
- approval gates and reviewer;
- isolation, parallel lanes, active writer, and integration owner;
- trigger mode;
- prohibited mutations;
- safe stop condition.

If the request touches hard-stop areas, list the decisions needed before implementation.

Do not implement yet. Produce the work order first. Use Accepted only after its scope and authority are explicitly approved; use Active only once execution starts.
```
