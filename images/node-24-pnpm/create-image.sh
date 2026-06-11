#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-node-24-pnpm..."
docker build \
    -f "$REPO_ROOT/images/node-24-pnpm/Dockerfile" \
    -t "thaz-node-24-pnpm:latest" \
    "$REPO_ROOT"
echo "Done: thaz-node-24-pnpm:latest"
