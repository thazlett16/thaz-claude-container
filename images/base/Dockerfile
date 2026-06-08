FROM buildpack-deps:trixie-curl

# ── System dependencies ──────────────────────────────────────────────────────
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
		file \
        git \
        imagemagick \
		openssh-client \
        unzip \
        xz-utils \
        ; \
    apt-get dist-clean

# ── Python Scripting dependencies ────────────────────────────────────────────
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
    mkdir -p -m 755 /etc/apt/keyrings; \
    out=$(mktemp); \
    wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg; \
    cat $out; \
    tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null; \
    chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg; \
    mkdir -p -m 755 /etc/apt/sources.list.d; \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main"; \
    tee /etc/apt/sources.list.d/github-cli.list > /dev/null; \
    cat $out; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        gh \
        ; \
    apt-get dist-clean

# ── NVM, Node 24, and PNPM ───────────────────────────────────────────────────

# ── Vite+ (unified web toolchain) ────────────────────────────────────────────

# ── Claude Code / OpenCode ───────────────────────────────────────────────────

# ── Volumes for tooling and auth (Claude, Git, PNPM Cache etc) ───────────────
