FROM node:lts-trixie-slim

# ── System dependencies ───────────────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    gnupg \
    less \
    openjdk-21-jdk \
    python3 \
    python3-pip \
    python3-venv \
    unzip \
    wget \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# ── GitHub CLI ────────────────────────────────────────────────────────────────
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# ── Rust ──────────────────────────────────────────────────────────────────────
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path

# ── Go ────────────────────────────────────────────────────────────────────────
ENV GOLANG_VERSION=1.23.4
RUN curl -fsSL "https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" \
    | tar -C /usr/local -xz
ENV PATH=/usr/local/go/bin:$PATH

# ── Zig ───────────────────────────────────────────────────────────────────────
ENV ZIG_VERSION=0.13.0
RUN curl -fsSL "https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz" \
    | tar -C /usr/local -xJ \
    && ln -s /usr/local/zig-linux-x86_64-${ZIG_VERSION}/zig /usr/local/bin/zig

# ── JDK 21 ────────────────────────────────────────────────────────────────────
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

# ── Maven ──────────────────────────────────────────────────────────────────────
ENV MAVEN_VERSION=3.9.14
RUN curl -fsSL "https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
    | tar -C /usr/local -xz \
    && ln -s /usr/local/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn
ENV MAVEN_HOME=/usr/local/apache-maven-${MAVEN_VERSION}

# ── PNPM (system-wide, before user is created) ───────────────────────────────
RUN npm install -g pnpm

# ── Claude Code / OpenCode ────────────────────────────────────────────────────
RUN npm install -g @anthropic-ai/claude-code opencode-ai

# ── Vite+ (unified web toolchain) ─────────────────────────────────────────────
RUN curl -fsSL https://vite.plus | bash

# ── Workspace ─────────────────────────────────────────────────────────────────
WORKDIR /workspace

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "node" ]
