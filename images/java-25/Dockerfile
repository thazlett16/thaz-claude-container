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
    bash /scripts/create-user.sh "$USER_UID" "$USER_GID" "$USER_NAME"

RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/create-workspace.sh "$USER_NAME" "$WORKSPACE"

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

# ── JDK 25 (OpenJDK) ─────────────────────────────────────────────────────────
ENV JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64

RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-jdk25.sh

# ── Maven ─────────────────────────────────────────────────────────────────────
ENV MAVEN_VERSION=3.9.16
ENV MAVEN_HOME=/usr/local/apache-maven-${MAVEN_VERSION}

RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-maven3_9.sh

WORKDIR $WORKSPACE
