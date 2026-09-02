#!/usr/bin/env bash
# Environment setup script for Claude Code on the web.
#
# Downloads settings.json from this repo and installs it as the user-wide
# Claude Code settings file at $HOME/.claude/settings.json. Any existing file
# is overwritten so re-running always picks up the latest version.
#
# Override the source with CLAUDE_SETTINGS_URL (any URL curl understands,
# including file://) for testing or to point at a branch/fork.
set -euo pipefail

SETTINGS_URL="${CLAUDE_SETTINGS_URL:-https://raw.githubusercontent.com/cblecker/claude-settings/main/settings.json}"
dest="$HOME/.claude/settings.json"

mkdir -p "$(dirname "$dest")"

# Download to a temp file beside the destination so a failed or partial
# download never leaves a truncated settings.json behind.
tmp="$(mktemp "$dest.XXXXXX")"
trap 'rm -f "$tmp"' EXIT

curl -fsSL --retry 3 "$SETTINGS_URL" -o "$tmp"
mv "$tmp" "$dest"

echo "wrote $dest from $SETTINGS_URL"
