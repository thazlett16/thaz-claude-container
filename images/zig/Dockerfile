FROM thaz-base:latest

USER root

ENV ZIG_VERSION=0.13.0

# ── Zig ───────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/zig,target=/scripts \
    bash /scripts/install-zig.sh "$ZIG_VERSION"

USER developer
WORKDIR /workspace
