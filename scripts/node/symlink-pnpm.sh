#!/usr/bin/env bash
set -euo pipefail

. "$NVM_DIR/nvm.sh"
ln -sf "$(command -v pnpm)" /usr/local/bin/pnpm
