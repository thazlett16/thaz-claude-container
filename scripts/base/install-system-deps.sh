#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y --no-install-recommends \
    file \
    git \
    gnupg \
    imagemagick \
    less \
    openssh-client \
    unzip \
    xz-utils
apt-get dist-clean
