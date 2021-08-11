#!/usr/bin/env bash

SYNCTHING_URL="https://api.github.com/repos/syncthing/syncthing/releases"

FULL_LAST_VERSION=$(curl -SsL ${SYNCTHING_URL} | jq .[0].name -r)
LAST_VERSION="${FULL_LAST_VERSION:1}"

sed -i -e "s|SYNCTHING_VERSION='.*'|SYNCTHING_VERSION='${LAST_VERSION}'|" Dockerfile*

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
