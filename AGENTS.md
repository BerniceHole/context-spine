# AGENTS.md

## Purpose

This repository is the public distributable starter kit for Context Spine.

Do not treat this repository as an active user project. It should not contain live root `ai-state/` maintenance records. Reusable target-project templates live under `templates/minimal/`.

## Source of truth

Use repository files, not chat history, as the working state.

Read in this order when maintaining this repository:

1. `README.md`
2. `RESEARCH.md`, only for method-level rationale or wording consistency
3. `templates/minimal/AGENTS.md`
4. `templates/minimal/ai-state/*.md`
5. relevant files in `chatgpt/`, `codex/`, `prompts/`, `.agents/skills/`, `templates/`, `examples/`, or `scripts/`

## Repository boundary

- Do not create or update root `ai-state/` files in this repository unless the maintainer explicitly asks for this repository to self-apply Context Spine.
- Do not add personal working preferences, private project state, organization-specific assumptions, client information, secrets, or private logs to reusable templates.
- Public reusable templates must be generic and copyable.
- `LICENSE` may contain the copyright holder. Reusable instructions and prompts should not assume any specific person, organization, product, or repository owner.

## Working rules

- Keep the starter kit small.
- Prefer generic templates over project-specific examples.
- Do not make optional files look required.
- Do not perform broad formatting cleanup unless requested.
- Do not edit `RESEARCH.md` when changing starter-kit files unless the user explicitly asks for research article edits.
- Do not change licensing terms unless explicitly asked.
- Preserve validation honesty: `Passed`, `Failed`, and `Not run`.

## Hard-stop areas

Stop and ask before changing:

- license or copyright holder;
- public claims about effectiveness;
- repository layout or install-script behavior;
- ChatGPT/Codex instruction semantics;
- security, privacy, or secrets-handling guidance;
- research article claims, references, or evaluation language;
- anything that would publish personal, confidential, or organization-specific state.

## Validation for docs-only changes

Use the smallest relevant checks:

```sh
git diff --check
grep -Rni "REPLACE_WITH_" . --exclude-dir=.git --exclude=AGENTS.md || true
git ls-files ai-state
```

Expected:

- no root `ai-state/` files are tracked;
- no maintainer-specific language appears in reusable prompts/templates;
- copyright-holder text should appear only in `LICENSE`;
- links and file paths referenced by `README.md` exist.

## Final report

Include:

- work performed;
- files changed;
- validation run;
- checks not run and why;
- any decisions or human follow-up needed.
