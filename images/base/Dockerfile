FROM buildpack-deps:trixie-curl

# ── developer user (UID/GID 1000) ────────────────────────────────────────────
ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_NAME=developer

RUN set -eux; \
    groupadd --gid $USER_GID $USER_NAME; \
    useradd --uid $USER_UID --gid $USER_GID --create-home --shell /bin/bash $USER_NAME

# ── System dependencies ──────────────────────────────────────────────────────
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        file \
        git \
        gnupg \
        imagemagick \
        less \
        openssh-client \
        unzip \
        xz-utils \
        ; \
    apt-get dist-clean

# ── Python scripting ─────────────────────────────────────────────────────────
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        ; \
    apt-get dist-clean

# ── GitHub CLI ───────────────────────────────────────────────────────────────
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        gh \
        ; \
    apt-get dist-clean
# RUN set -eux; \
#    mkdir -p -m 755 /etc/apt/keyrings; \
#    wget -nv -O /etc/apt/keyrings/githubcli-archive-keyring.gpg \
#        https://cli.github.com/packages/githubcli-archive-keyring.gpg; \
#    chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg; \
#    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
#        > /etc/apt/sources.list.d/github-cli.list; \
#    apt-get update; \
#    apt-get install -y --no-install-recommends gh; \
#    apt-get dist-clean

# ── NVM + Node ───────────────────────────────────────────────────────────────
ARG NVM_VERSION=v0.40.1
ARG NODE_VERSION=lts
ARG NPM_VERSION=lts

USER developer

ENV NVM_DIR=/home/developer/.nvm \
    NODE_VERSION=24

RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install "$NODE_VERSION" \
    && nvm alias default "$NODE_VERSION" \
    && nvm use default

# ── Claude Code / OpenCode ───────────────────────────────────────────────────
# Installed as developer so packages land in NVM's global bin (developer-owned)
RUN . "$NVM_DIR/nvm.sh" \
    && npm install -g @anthropic-ai/claude-code opencode-ai

# ── Symlinks for non-interactive shells ──────────────────────────────────────
USER root
RUN . "$NVM_DIR/nvm.sh" \
    && ln -sf "$(which node)" /usr/local/bin/node \
    && ln -sf "$(which npm)" /usr/local/bin/npm \
    && ln -sf "$(which npx)" /usr/local/bin/npx \
    && ln -sf "$(which claude)" /usr/local/bin/claude

# ── Workspace ────────────────────────────────────────────────────────────────
RUN mkdir -p /workspace && chown developer:developer /workspace

USER developer
WORKDIR /workspace
