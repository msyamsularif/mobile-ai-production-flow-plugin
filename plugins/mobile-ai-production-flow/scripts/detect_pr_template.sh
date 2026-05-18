#!/usr/bin/env bash
set -euo pipefail

# Detect pull request template files in common GitHub locations.
# Returns first matched template path and exits 0.
# If no template exists, prints a not found message and exits 0.

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository. Unable to detect PR template."
  exit 0
fi

templates=(
  ".github/pull_request_template.md"
  ".github/PULL_REQUEST_TEMPLATE.md"
  ".github/docs/pull_request_template.md"
)

for f in "${templates[@]}"; do
  if [ -f "$f" ]; then
    echo "PR template detected: $f"
    exit 0
  fi
done

# Directory-style templates (GitHub supports multiple templates)
if [ -d ".github/PULL_REQUEST_TEMPLATE" ]; then
  first_template="$(find ".github/PULL_REQUEST_TEMPLATE" -maxdepth 1 -type f \( -name "*.md" -o -name "*.markdown" \) | head -n 1 || true)"
  if [ -n "${first_template:-}" ]; then
    echo "PR template detected: $first_template"
    exit 0
  fi
fi

echo "PR template not found in .github. Use standard Draft PR body format from plugin policy."
exit 0
