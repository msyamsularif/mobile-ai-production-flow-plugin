#!/usr/bin/env bash
set -euo pipefail
if [ -f "pubspec.yaml" ]; then
  echo "flutter"
elif [ -f "settings.gradle" ] || [ -f "settings.gradle.kts" ]; then
  echo "android"
elif ls *.xcodeproj >/dev/null 2>&1 || ls *.xcworkspace >/dev/null 2>&1; then
  echo "ios"
else
  echo "unknown"
fi
