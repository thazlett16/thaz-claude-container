FROM thaz-base:latest

# ── NVM + Node ───────────────────────────────────────────────────────────────
ARG NVM_VERSION=v0.40.5
ARG NODE_VERSION=v24

USER $USER_NAME

ENV NVM_DIR=/home/$USER_NAME/.nvm

RUN set -eux; \
    NVM_INSTALLER=$(mktemp); \
    trap 'rm -f "$NVM_INSTALLER"' EXIT; \
    if ! curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" -o "$NVM_INSTALLER"; then \
      LATEST_NVM_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/'); \
      curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/${LATEST_NVM_VERSION}/install.sh" -o "$NVM_INSTALLER"; \
    fi; \
    bash "$NVM_INSTALLER"

RUN set -ex; \
    . "$NVM_DIR/nvm.sh"; \
    nvm install "$NODE_VERSION"


# ── PNPM ─────────────────────────────────────────────────────────────────────
RUN . "$NVM_DIR/nvm.sh" \
    && npm install -g pnpm

USER root
RUN . "$NVM_DIR/nvm.sh" \
    && ln -sf "$(which pnpm)" /usr/local/bin/pnpm

# ── Vite+ (unified web toolchain) ────────────────────────────────────────────
USER developer
RUN . "$NVM_DIR/nvm.sh" \
    && curl -fsSL https://vite.plus | bash

ENV PATH="/home/developer/.vite-plus/bin:$PATH"

# ── Symlinks for non-interactive shells ──────────────────────────────────────
#USER root
#RUN . "$NVM_DIR/nvm.sh" \
#    && ln -sf "$(which node)" /usr/local/bin/node \
#    && ln -sf "$(which npm)" /usr/local/bin/npm \
#    && ln -sf "$(which npx)" /usr/local/bin/npx \
#    && ln -sf "$(which claude)" /usr/local/bin/claude

WORKDIR /workspace
