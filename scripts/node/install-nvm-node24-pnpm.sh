#!/usr/bin/env bash
set -euo pipefail

NVM_DIR="$1"
NVM_VERSION=v0.40.5
NODE_VERSION=v24

NVM_INSTALLER=$(mktemp)
trap 'rm -f "$NVM_INSTALLER"' EXIT

curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" -o "$NVM_INSTALLER"

bash "$NVM_INSTALLER"

. "$NVM_DIR/nvm.sh"

nvm install "$NODE_VERSION"
nvm alias default "$NODE_VERSION"
nvm use "$NODE_VERSION"

npm install -g pnpm
