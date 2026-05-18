#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/create_work_branch.sh --summary "<title-or-summary>" [--jira GZ-1234]

Rules:
  - With --jira: feature/<jira-lowercase>-<summary-slug>
  - Without --jira: experimental/<summary-slug>
  - Base branch: current checked out branch
EOF
}

require_git_repo() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: current directory is not a git repository." >&2
    exit 1
  fi
}

slugify() {
  echo "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g' \
    | sed -E 's/^-+|-+$//g' \
    | sed -E 's/-+/-/g'
}

JIRA_KEY=""
SUMMARY=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --jira)
      JIRA_KEY="${2:-}"
      shift 2
      ;;
    --summary)
      SUMMARY="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [ -z "$SUMMARY" ]; then
  echo "Error: --summary is required." >&2
  usage
  exit 1
fi

require_git_repo

CURRENT_BRANCH="$(git branch --show-current)"
if [ -z "$CURRENT_BRANCH" ]; then
  echo "Error: unable to detect current branch." >&2
  exit 1
fi

SUMMARY_SLUG="$(slugify "$SUMMARY")"
if [ -z "$SUMMARY_SLUG" ]; then
  echo "Error: summary produced an empty slug. Please provide a clearer summary." >&2
  exit 1
fi

if [ -n "$JIRA_KEY" ]; then
  JIRA_SLUG="$(slugify "$JIRA_KEY")"
  if ! echo "$JIRA_SLUG" | grep -Eq '^[a-z0-9]+-[0-9]+$'; then
    echo "Error: invalid Jira key format. Example: GZ-1234" >&2
    exit 1
  fi
  TARGET_BRANCH="feature/${JIRA_SLUG}-${SUMMARY_SLUG}"
else
  TARGET_BRANCH="experimental/${SUMMARY_SLUG}"
fi

if git rev-parse --verify --quiet "$TARGET_BRANCH" >/dev/null; then
  echo "Error: branch already exists: $TARGET_BRANCH" >&2
  exit 1
fi

git checkout -b "$TARGET_BRANCH"

cat <<EOF
Branch created successfully.
- Base branch: $CURRENT_BRANCH
- New branch:  $TARGET_BRANCH
EOF
