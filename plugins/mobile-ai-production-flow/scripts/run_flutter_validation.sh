#!/usr/bin/env bash
set -euo pipefail
if ! command -v flutter >/dev/null 2>&1; then
  echo "flutter command not found" >&2
  exit 127
fi

dart format --set-exit-if-changed .
flutter analyze
flutter test
