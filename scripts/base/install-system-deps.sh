#!/usr/bin/env bash
set -euo pipefail

apt-get update
apt-get install -y --no-install-recommends \
    apt-utils \
    file \
    git \
    gnupg \
    htop \
    imagemagick \
    jq \
    less \
    man-db \
    manpages \
    manpages-dev \
    nano \
    neovim \
    net-tools \
    openssh-client \
    sudo \
    tree \
    unzip \
    vim \
    xz-utils \
    zip \
    zsh
apt-get dist-clean
