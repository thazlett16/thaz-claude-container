FROM buildpack-deps:trixie-curl

# ── developer user (UID/GID 1000) ────────────────────────────────────────────
ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_NAME=developer

RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/create-user.sh "$USER_UID" "$USER_GID" "$USER_NAME"

ENV WORKSPACE=/home/$USER_NAME/workspace

RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/create-workspace.sh "$USER_NAME" "$WORKSPACE"

# ── System dependencies ──────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/install-system-deps.sh

# ── Python scripting ─────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/python,target=/scripts \
    bash /scripts/install-python.sh

# ── GitHub CLI ───────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/install-github-cli.sh

# ── Claude Code / OpenCode ───────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/install-claude-code.sh

USER $USER_NAME
WORKDIR $WORKSPACE
