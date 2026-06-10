FROM buildpack-deps:trixie-curl

# ── developer user ────────────────────────────────────────────
ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_NAME=developer
ARG WORKSPACE=/home/$USER_NAME/workspace

RUN --mount=type=bind,source=scripts/base,target=/scripts \
    bash /scripts/create-user.sh "$USER_UID" "$USER_GID" "$USER_NAME"

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

ENV JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64
ENV MAVEN_VERSION=3.9.16
ENV MAVEN_HOME=/usr/local/apache-maven-${MAVEN_VERSION}

# ── JDK 8 (Eclipse Temurin / Adoptium) ───────────────────────────────────────
RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-jdk25.sh

# ── Maven ─────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-maven3_9.sh

USER $USER_NAME
WORKDIR $WORKSPACE
