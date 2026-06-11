#!/usr/bin/env bash
set -euo pipefail

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian
GITHUB_CLI_INSTALLER=$(mktemp)
trap 'rm -f "$GITHUB_CLI_INSTALLER"' EXIT

curl -fsSL "https://cli.github.com/packages/githubcli-archive-keyring.gpg" -o "$GITHUB_CLI_INSTALLER"

sudo mkdir -p -m 755 /etc/apt/keyrings
cat "$GITHUB_CLI_INSTALLER" \
    | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
sudo mkdir -p -m 755 /etc/apt/sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    gh
sudo apt-get dist-clean
