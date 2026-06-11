#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y --no-install-recommends pipx
apt-get dist-clean
