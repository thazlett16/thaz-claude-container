#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-zig..."
docker build \
    -f "$REPO_ROOT/images/zig/Dockerfile" \
    -t "thaz-zig:latest" \
    "$REPO_ROOT"
echo "Done: thaz-zig:latest"
