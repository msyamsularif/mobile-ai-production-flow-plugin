#!/usr/bin/env bash
set -euo pipefail
ROOT="${CLAUDE_PLUGIN_ROOT:-${PLUGIN_ROOT:-$(pwd)}}"
required=(
  "policies/automation-boundary.md"
  "policies/jira-deep-scan-rules.md"
  "policies/source-priority-rules.md"
  "policies/draft-pr-rules.md"
)
missing=0
for f in "${required[@]}"; do
  if [ ! -f "$ROOT/$f" ]; then
    echo "Missing plugin policy: $f" >&2
    missing=1
  fi
done
if [ "$missing" -ne 0 ]; then
  exit 2
fi
echo "Mobile AI Production Flow context loaded. Automation ends at Draft PR."
