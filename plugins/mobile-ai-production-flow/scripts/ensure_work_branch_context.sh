#!/usr/bin/env bash
set -euo pipefail

# Non-blocking guard: remind engineer if current branch does not follow
# the expected development branch convention.

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Branch guard: not inside a git repository. Skipping branch convention check."
  exit 0
fi

current_branch="$(git branch --show-current 2>/dev/null || true)"
if [ -z "$current_branch" ]; then
  echo "Branch guard: unable to detect current branch. Skipping branch convention check."
  exit 0
fi

if echo "$current_branch" | grep -Eq '^(feature|experimental)/'; then
  echo "Branch guard: OK ($current_branch)"
  exit 0
fi

cat <<EOF
Branch guard reminder:
- Current branch: $current_branch
- Expected branch prefix before coding: feature/ or experimental/
- If Jira ticket exists: feature/<jira-id-lowercase>-<summary-slug>
- If no Jira ticket (POC/experiment): experimental/<summary-slug>
- Helper: scripts/create_work_branch.sh --jira GZ-1234 --summary "Implementasi Feature Flag"
EOF

exit 0
