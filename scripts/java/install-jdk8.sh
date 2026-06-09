#!/usr/bin/env bash
set -euo pipefail

# https://adoptium.net/installation/linux
apt-get update
apt-get install -y --no-install-recommends \
    wget \
    apt-transport-https \
    gpg
apt-get dist-clean

wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null

echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

apt-get update
apt-get install -y --no-install-recommends \
    temurin-8-jdk
apt-get dist-clean
