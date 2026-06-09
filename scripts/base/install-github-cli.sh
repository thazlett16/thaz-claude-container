#!/usr/bin/env bash
set -euo pipefail

# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian
mkdir -p -m 755 /etc/apt/keyrings
wget -nv -O /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    https://cli.github.com/packages/githubcli-archive-keyring.gpg
chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    > /etc/apt/sources.list.d/github-cli.list
apt-get update
apt-get install -y --no-install-recommends gh
apt-get dist-clean
