#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-vite-plus..."
docker build \
    -f "$REPO_ROOT/images/vite-plus/Dockerfile" \
    -t "thaz-vite-plus:latest" \
    "$REPO_ROOT"
echo "Done: thaz-vite-pluswhich:latest"
