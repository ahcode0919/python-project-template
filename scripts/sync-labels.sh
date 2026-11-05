#!/usr/bin/env bash
# Create or update the release labels used by Release Drafter.
# Usage: scripts/sync-labels.sh [owner/repo]   (defaults to the current repo)
set -euo pipefail

if [[ $# -gt 0 ]]; then
  export GH_REPO="$1"
fi

# name|color|description
labels=(
  "breaking|b60205|Breaking change (major version bump)"
  "feature|0e8a16|New feature (minor version bump)"
  "enhancement|a2eeef|Improvement to an existing feature (minor version bump)"
  "bug|d73a4a|Bug fix (patch version bump)"
  "fix|d73a4a|Fix (patch version bump)"
  "chore|ededed|Maintenance (patch version bump)"
  "ci|1d76db|CI / build tooling (patch version bump)"
  "dependencies|0366d6|Dependency update (patch version bump)"
  "documentation|0075ca|Documentation (patch version bump)"
  "refactor|fbca04|Refactor with no behavior change (patch version bump)"
  "skip-changelog|cccccc|Exclude from release notes"
)

for entry in "${labels[@]}"; do
  IFS='|' read -r name color description <<< "$entry"
  gh label create "$name" --color "$color" --description "$description" --force
  echo "synced: $name"
done
