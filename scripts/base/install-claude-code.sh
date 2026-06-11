#!/usr/bin/env bash
set -euo pipefail

CLAUDE_INSTALLER=$(mktemp)
trap 'rm -f "$CLAUDE_INSTALLER"' EXIT

curl -fsSL https://claude.ai/install.sh -o "$CLAUDE_INSTALLER"

bash "$CLAUDE_INSTALLER"
