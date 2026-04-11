FROM node:lts-slim

# ── System dependencies ───────────────────────────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    less \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# ── PNPM (system-wide, before user is created) ───────────────────────────────
RUN npm install -g pnpm

# ── Claude Code / OpenCode ────────────────────────────────────────────────────
RUN npm install -g @anthropic-ai/claude-code opencode-ai

# ── Workspace ─────────────────────────────────────────────────────────────────
WORKDIR /workspace
