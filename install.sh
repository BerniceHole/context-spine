#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./install.sh /path/to/target-project
  curl -fsSL https://raw.githubusercontent.com/BerniceHole/context-spine/main/install.sh | bash -s -- /path/to/target-project

Creates the minimal Context Spine files in a target project:
  AGENTS.md
  ai-state/CURRENT_STATE.md
  ai-state/DECISIONS.md
  ai-state/HANDOFF.md

The installer does not overwrite existing files.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

TARGET="${1:-.}"
TARGET_ABS="$(mkdir -p "${TARGET}" && cd "${TARGET}" && pwd)"

SCRIPT_SOURCE="${BASH_SOURCE[0]:-}"
SCRIPT_DIR=""
TEMPLATE_DIR=""
HAS_LOCAL_TEMPLATES="false"

if [[ -n "${SCRIPT_SOURCE}" && -e "${SCRIPT_SOURCE}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_SOURCE}")" 2>/dev/null && pwd || true)"
  if [[ -n "${SCRIPT_DIR}" ]]; then
    TEMPLATE_DIR="${SCRIPT_DIR}/templates/minimal"
    if [[ -f "${TEMPLATE_DIR}/AGENTS.md" && -f "${TEMPLATE_DIR}/ai-state/CURRENT_STATE.md" && -f "${TEMPLATE_DIR}/ai-state/DECISIONS.md" && -f "${TEMPLATE_DIR}/ai-state/HANDOFF.md" ]]; then
      HAS_LOCAL_TEMPLATES="true"
    fi
  fi
fi

# Avoid accidentally installing live state into this public starter repository itself.
if [[ "${HAS_LOCAL_TEMPLATES}" == "true" && "${TARGET_ABS}" == "${SCRIPT_DIR}" ]]; then
  echo "Refusing to install root ai-state into the context-spine starter repository itself." >&2
  echo "Choose a target project directory instead." >&2
  exit 1
fi

write_file_if_missing() {
  local dst="$1"
  local label="$2"
  if [[ -e "${dst}" ]]; then
    echo "skip: ${dst} already exists"
  else
    mkdir -p "$(dirname "${dst}")"
    cat > "${dst}"
    echo "create: ${dst} (${label})"
  fi
}

copy_or_write() {
  local src="$1"
  local dst="$2"
  local label="$3"
  if [[ -e "${dst}" ]]; then
    echo "skip: ${dst} already exists"
  elif [[ "${HAS_LOCAL_TEMPLATES}" == "true" && -f "${src}" ]]; then
    mkdir -p "$(dirname "${dst}")"
    cp "${src}" "${dst}"
    echo "create: ${dst} (${label})"
  else
    return 1
  fi
}

if ! copy_or_write "${TEMPLATE_DIR}/AGENTS.md" "${TARGET_ABS}/AGENTS.md" "local template"; then
  write_file_if_missing "${TARGET_ABS}/AGENTS.md" "embedded template" <<'EOF'
# AGENTS.md

## Purpose

This repository uses Context Spine. The repository state, not chat history, is the source of truth.

Context Spine adds a small operating layer for project state, decisions, handoff, validation, and agent behavior. It does not replace the target project’s product structure, documentation architecture, design system, roadmap, information architecture, brand system, or domain model.

## Read order

1. `ai-state/HANDOFF.md`
2. `ai-state/CURRENT_STATE.md`
3. active task file in `ai-state/tasks/`, if provided
4. relevant entries in `ai-state/DECISIONS.md`
5. `ai-state/QUALITY_BAR.md`, if present and the task affects quality, UI, product, research, content, or brand

## Working rules

- Stay inside the task scope.
- Ask before changing hard-stop areas.
- Do not add dependencies without approval.
- Prefer small diffs.
- Do not perform opportunistic refactors unless requested.
- Do not treat draft or scratch files as source of truth.
- Do not rely on tool memory or auto-memory for required project rules.
- Do not copy secrets, credentials, customer data, private logs, private URLs, or personal data into state files.
- Do not redesign the target project’s docs, roadmap, architecture, design system, brand system, or domain model unless explicitly asked.
- Before preparing next operational steps, check whether required human input is missing.
- Human input may be intent, source material, constraints, preferences, priorities, research direction, acceptance criteria, scope boundary, files, examples, or a decision.
- If missing input affects hard-stop areas, scope, quality, or project identity, ask before proceeding.
- Do not turn missing input into assumptions or premature next steps.

## Hard-stop areas

Ask before changing:

- authentication, authorization, permissions, account recovery;
- billing, pricing, payments, credits, subscriptions;
- database schema, migrations, destructive data operations;
- privacy, analytics tracking, retention policy, customer data;
- secrets, keys, tokens, sandbox permissions, external access;
- legal notices, compliance, licensing, public claims;
- accessibility requirements that affect real use;
- internationalization, localization, naming, market-specific UX;
- brand identity, tone, naming, visual language, design-system foundations;
- production infrastructure, CI, deployment, observability;
- new dependencies or major dependency upgrades;
- irreversible deletion, overwrite, or migration;
- contradictory instructions among user request, work order, state, and decisions.

## Validation

Run the checks relevant to the task.

Default software checks, when applicable:

```sh
npm run lint
npm run typecheck
npm test
```

Report every check as `Passed`, `Failed`, or `Not run`.

## Doc-sync

- Update `ai-state/HANDOFF.md` after meaningful work.
- Update `ai-state/CURRENT_STATE.md` when current truth changes.
- Append to `ai-state/DECISIONS.md` for durable decisions.
- Update the active task file when task status changes.
- If no state document changes, report why.

## Final report

Use this structure:

### Work performed

### Files changed

### Validated

Passed:
Failed:
Not run:

### State updated

### Decisions

### Needs human input

### Next
EOF
fi

if ! copy_or_write "${TEMPLATE_DIR}/ai-state/CURRENT_STATE.md" "${TARGET_ABS}/ai-state/CURRENT_STATE.md" "local template"; then
  write_file_if_missing "${TARGET_ABS}/ai-state/CURRENT_STATE.md" "embedded template" <<'EOF'
# Current State

## One-line summary

Unknown.

## Current product behavior

Unknown.

## Current architecture

Unknown.

## Implemented

Unknown.

## Intentionally not implemented

Unknown.

## Active constraints

Unknown.

## Known risks

Unknown.

## Last verified

Not run.

## Related decisions

None yet.
EOF
fi

if ! copy_or_write "${TEMPLATE_DIR}/ai-state/DECISIONS.md" "${TARGET_ABS}/ai-state/DECISIONS.md" "local template"; then
  write_file_if_missing "${TARGET_ABS}/ai-state/DECISIONS.md" "embedded template" <<'EOF'
# Decisions

Record durable project decisions here. Keep this file append-only.

## D-0001: Initial Context Spine setup

Date: YYYY-MM-DD
Status: Proposed | Accepted | Superseded | Rejected
Supersedes: none
Superseded by: none

### Context

The project is adopting Context Spine so future AI sessions can recover project state from repository files instead of chat history.

### Decision

Use the Spine Four as the minimal starting structure:

- `AGENTS.md`
- `ai-state/CURRENT_STATE.md`
- `ai-state/DECISIONS.md`
- `ai-state/HANDOFF.md`

### Consequences

- State documents must stay short, current, and operational.
- Optional documents should be added only when they prevent a repeated failure.
- Validation must be reported as `Passed`, `Failed`, or `Not run`.

### Alternatives considered

- Rely on chat history only.
- Add a larger memory-bank structure immediately.
EOF
fi

if ! copy_or_write "${TEMPLATE_DIR}/ai-state/HANDOFF.md" "${TARGET_ABS}/ai-state/HANDOFF.md" "local template"; then
  write_file_if_missing "${TARGET_ABS}/ai-state/HANDOFF.md" "embedded template" <<'EOF'
# Handoff

## Current focus

Unknown.

## Last completed

Initial Context Spine files created.

## Next action

Fill `CURRENT_STATE.md` with repository evidence and choose the next meaningful task.

## Blockers

Unknown.

## Needs human input

- Confirm project goal, non-goals, and immediate next task.

## Validation

Passed:
Failed:
Not run:
- Project-specific validation has not been run yet.

## Files or areas touched

- `AGENTS.md`
- `ai-state/CURRENT_STATE.md`
- `ai-state/DECISIONS.md`
- `ai-state/HANDOFF.md`

## Notes for next session

Use `AGENTS.md` and these state files as the source of truth. Do not rely on chat history.
EOF
fi

cat <<EOF

Context Spine minimal setup complete for:
${TARGET_ABS}

Next:
1. Fill ai-state/CURRENT_STATE.md from repository evidence.
2. Confirm the next meaningful task in ai-state/HANDOFF.md.
3. Start a fresh AI session with the resume prompt.
EOF
