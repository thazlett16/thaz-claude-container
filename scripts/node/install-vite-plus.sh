#!/usr/bin/env bash
set -euo pipefail

VITE_PLUS_DIR="$1"

VITE_PLUS_CLI_INSTALLER=$(mktemp)
trap 'rm -f "$VITE_PLUS_CLI_INSTALLER"' EXIT

curl -fsSL "https://vite.plus" -o "$VITE_PLUS_CLI_INSTALLER"

bash "$VITE_PLUS_CLI_INSTALLER"

. "$VITE_PLUS_DIR/env"

vp install -g pnpm
