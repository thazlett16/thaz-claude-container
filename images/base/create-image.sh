#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-base..."
docker build \
    --debug \
    --no-cache \
    -f "$REPO_ROOT/images/base/Dockerfile" \
    -t thaz-base:latest \
    "$REPO_ROOT"
echo "Done: thaz-base:latest"
