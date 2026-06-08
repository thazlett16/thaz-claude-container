FROM buildpack-deps:trixie-curl

# ── developer user (UID/GID 1000) ────────────────────────────────────────────
ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_NAME=developer

RUN set -eux; \
    groupadd --gid $USER_GID $USER_NAME; \
    useradd --uid $USER_UID --gid $USER_GID --create-home --shell /bin/bash $USER_NAME

ENV WORKSPACE=/home/$USER_NAME/workspace

RUN set -eux; \
    mkdir -p $WORKSPACE; \
    chown $USER_NAME:$USER_NAME $WORKSPACE

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

# ── Claude Code / OpenCode ───────────────────────────────────────────────────
RUN set -eux; \
    CLAUDE_INSTALLER=$(mktemp); \
    trap 'rm -f "$CLAUDE_INSTALLER"' EXIT; \
    curl -fsSL https://claude.ai/install.sh -o "$CLAUDE_INSTALLER"; \
    bash "$CLAUDE_INSTALLER"

# ── Symlinks for non-interactive shells ──────────────────────────────────────
USER root
#RUN set -eux; \
#    ln -sf "$(which claude)" /usr/local/bin/claude

WORKDIR $WORKSPACE
