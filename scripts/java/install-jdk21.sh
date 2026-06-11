#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y --no-install-recommends openjdk-21-jdk
sudo apt-get dist-clean
