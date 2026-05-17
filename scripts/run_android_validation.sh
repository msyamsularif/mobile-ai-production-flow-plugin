#!/usr/bin/env bash
set -euo pipefail
if [ -x "./gradlew" ]; then
  ./gradlew ktlintCheck || true
  ./gradlew detekt || true
  ./gradlew test
  ./gradlew assembleDebug
else
  echo "gradlew not found" >&2
  exit 127
fi
