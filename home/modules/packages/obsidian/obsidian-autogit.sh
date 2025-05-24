#!usr/bin/env bash

VAULT = "$HOME/Documents/obsidian-vault/"

cd "$VAULT" || exit 1

# Skip if no changes
if [[-n "$(git status --porcelain)"]]; then
  git add .
  git commit -m "Auto backup $(date +'%Y-%m-%d %H:%M:%S')"
  git push origin main
fi
