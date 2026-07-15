# New-Project Bootstrap Sample

This trace shows proportional bootstrap for an explicitly designated empty non-Git directory. It is illustrative, not an additional required artifact.

## 1. Accepted instruction

```txt
Use /path/to/new-project as a new repository-backed project. Create the directory if needed, initialize Git, add only minimal repository hygiene and the Context Spine Four, validate them, and create one local root commit. Do not push, install dependencies, or invent product structure.
```

The instruction supplies local bootstrap authority and a local-commit integration outcome. It does not authorize a remote or external effect.

## 2. Classify the designated root

Inspect the root before mutation.

| Finding | Classification | Route |
| --- | --- | --- |
| Directory is absent or empty | Expected | Create it if needed and continue. |
| `.DS_Store` | Incidental | Add the minimal matching ignore entry and continue. |
| Harmless ignored editor cache | Incidental | Ignore it only if doing so does not change project identity. |
| Existing `.git/` history | Material | Stop; the root is not a new repository. |
| Secret, credential, or private key | Material | Stop and report without copying the value. |
| Existing source or conflicting project files | Material | Stop; scope or project identity is ambiguous. |
| Unclear parent versus child project root | Material | Stop and request the intended root. |

Only material mismatches trigger the safe stop.

## 3. Bootstrap flow

```text
designated empty directory
→ classify contents
→ git init
→ minimal .gitignore
→ Spine Four
→ validation
→ one local root commit when authorized
```

1. Create the designated root if needed.
2. Run `git init`. Follow an explicit branch policy or the configured Git default; do not invent a branch name.
3. Create a minimal `.gitignore` only for incidental metadata actually relevant to the root.
4. Create:
   - `AGENTS.md`
   - `ai-state/CURRENT_STATE.md`
   - `ai-state/DECISIONS.md`
   - `ai-state/HANDOFF.md`
5. Record `unborn HEAD` as the revision until the first commit exists.
6. Keep project-specific facts `Unknown` where evidence is absent.

## 4. Validation and integration

Before the root commit:

```sh
git status --short
git add AGENTS.md ai-state .gitignore
git diff --cached --check
python3 /path/to/context-spine/scripts/spine-doctor /path/to/new-project
```

This sample has created `.gitignore` for incidental metadata; omit that path from `git add` when no ignore file was needed. Record each result as `Passed`, `Failed`, or `Not run`. If all required checks pass, create the single authorized local root commit, then read back `git rev-parse HEAD` for the final report. The bootstrap files describe the pre-commit revision as `unborn HEAD`; the resulting root commit becomes the first canonical Git revision and is reported by readback rather than attempting a self-referential commit hash.

No branch push, pull request, dependency installation, deployment, publication, or product decision is implied.
