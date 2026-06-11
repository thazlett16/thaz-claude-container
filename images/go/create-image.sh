#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-go..."
docker build \
    --no-cache \
    --build-arg USER_UID=1000 \
    --build-arg USER_GID=1000 \
    --build-arg USER_NAME=developer \
    -f "$REPO_ROOT/images/go/Dockerfile" \
    -t "thaz-go:latest" \
    "$REPO_ROOT"
echo "Done: thaz-go:latest"
