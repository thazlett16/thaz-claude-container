#!/usr/bin/env bash
set -euo pipefail

ZIG_VERSION="${1:?ZIG_VERSION argument is required}"

curl -fsSL "https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz" \
    | tar -C /usr/local -xJ
ln -sf "/usr/local/zig-linux-x86_64-${ZIG_VERSION}/zig" /usr/local/bin/zig
