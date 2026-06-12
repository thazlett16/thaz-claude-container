FROM buildpack-deps:trixie-curl

# ── System dependencies ──────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/install-system-deps.sh

# ── developer user ───────────────────────────────────────────────────────────
ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_NAME=developer
ARG WORKSPACE=/home/$USER_NAME/workspace

RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/create-user.sh "$USER_UID" "$USER_GID" "$USER_NAME" "$WORKSPACE"

VOLUME ["/home/$USER_NAME/.config/git"]
VOLUME ["/home/$USER_NAME/.config/gh"]

USER $USER_NAME

# ── Python scripting ─────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/python,target=/scripts \
    bash /scripts/install-python.sh

# ── GitHub CLI ───────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/install-github-cli.sh

# ── Claude Code / OpenCode ───────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/install-claude-code.sh

WORKDIR $WORKSPACE
