#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv
sudo apt-get dist-clean
