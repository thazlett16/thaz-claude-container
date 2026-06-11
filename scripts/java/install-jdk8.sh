#!/usr/bin/env bash
set -euo pipefail

# https://adoptium.net/installation/linux#deb-installation-on-debian-or-ubuntu
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    wget \
    apt-transport-https \
    gpg
sudo apt-get dist-clean

wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public \
    | gpg --dearmor \
    | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null

echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" \
    | sudo tee /etc/apt/sources.list.d/adoptium.list

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    temurin-8-jdk
sudo apt-get dist-clean
