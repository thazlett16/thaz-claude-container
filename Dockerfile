FROM node:lts-slim

# ── System dependencies ───────────────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    less \
    libssl-dev \
    openjdk-21-jdk \
    pkg-config \
    python3 \
    python3-pip \
    python3-venv \
    sudo \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# ── Java 21 ───────────────────────────────────────────────────────────────────
# Symlink to a stable, arch-independent path
RUN ln -sf "$(dirname "$(dirname "$(readlink -f "$(which java)")")")" /opt/java
ENV JAVA_HOME=/opt/java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# ── Go ────────────────────────────────────────────────────────────────────────
ARG GO_VERSION=1.24.2
RUN set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
      amd64) GOARCH=amd64 ;; \
      arm64) GOARCH=arm64 ;; \
      *) echo "Unsupported arch: ${ARCH}" && exit 1 ;; \
    esac; \
    curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-${GOARCH}.tar.gz" \
      | tar -C /usr/local -xzf -
ENV PATH="/usr/local/go/bin:${PATH}"

# ── Rust ──────────────────────────────────────────────────────────────────────
# Toolchain is baked into the image at a system path so it isn't shadowed
# by the user-level cache mount at runtime.
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --no-modify-path --default-toolchain stable
ENV PATH="/usr/local/cargo/bin:${PATH}"

# ── GitHub CLI ───────────────────────────────────────────────────────────────
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends gh \
    && rm -rf /var/lib/apt/lists/*

# ── PNPM (system-wide, before user is created) ───────────────────────────────
RUN npm install -g pnpm

# ── Claude Code / OpenCode ────────────────────────────────────────────────────
RUN npm install -g @anthropic-ai/claude-code opencode-ai

# ── Non-root user ─────────────────────────────────────────────────────────────
# Pass --build-arg UID=$(id -u) GID=$(id -g) to match your host user and avoid
# bind-mount ownership mismatches.
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} dev \
    && useradd -m -u ${UID} -g ${GID} -s /bin/bash dev \
    && echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/dev \
    && chmod 0440 /etc/sudoers.d/dev

# Give the dev user write access to global node dirs
RUN mkdir -p /usr/local/lib/node_modules \
    && chown -R dev:dev /usr/local/lib/node_modules \
    && chown -R dev:dev /usr/local/bin

USER dev
ENV HOME=/home/dev

# ── User-level env vars ───────────────────────────────────────────────────────
# Go: pkg/mod + build cache — bind-mount from host (see docker-compose.yml)
ENV GOPATH="/home/dev/go"
ENV GOCACHE="/home/dev/.cache/go-build"

# Cargo registry/git (separate from toolchain at /usr/local/cargo)
# bind-mount ~/.cargo/registry and ~/.cargo/git from host
ENV CARGO_HOME="/home/dev/.cargo"

# pip, npm, pnpm store — bind-mount from host
ENV PIP_CACHE_DIR="/home/dev/.cache/pip"
ENV NPM_CONFIG_CACHE="/home/dev/.npm"
ENV PNPM_HOME="/home/dev/.local/share/pnpm"
ENV PATH="${PNPM_HOME}:${PATH}"

# Java build tools
ENV GRADLE_USER_HOME="/home/dev/.gradle"

# ── Workspace ─────────────────────────────────────────────────────────────────
WORKDIR /workspace

COPY --chown=dev:dev entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
