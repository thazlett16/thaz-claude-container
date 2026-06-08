FROM thaz-base:latest

USER root

# ── Zig ───────────────────────────────────────────────────────────────────────
ENV ZIG_VERSION=0.13.0

RUN curl -fsSL "https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz" \
    | tar -C /usr/local -xJ \
    && ln -s "/usr/local/zig-linux-x86_64-${ZIG_VERSION}/zig" /usr/local/bin/zig

USER developer
WORKDIR /workspace
