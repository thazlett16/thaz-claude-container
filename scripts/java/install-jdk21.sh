#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y --no-install-recommends openjdk-21-jdk
apt-get dist-clean
