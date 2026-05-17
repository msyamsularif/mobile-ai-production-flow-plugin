#!/usr/bin/env bash
set -euo pipefail
if command -v swiftlint >/dev/null 2>&1; then
  swiftlint
else
  echo "swiftlint not found; skipping" >&2
fi
xcodebuild -list >/dev/null
