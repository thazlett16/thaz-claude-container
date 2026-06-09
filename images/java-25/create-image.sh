#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

if ! docker image inspect thaz-base:latest > /dev/null 2>&1; then
    echo "Base image not found — building it first..."
    bash "$REPO_ROOT/images/base/create-image.sh"
fi

echo "Building thaz-java-25..."
docker build \
    -f "$REPO_ROOT/images/java-25/Dockerfile" \
    -t "thaz-java-25:latest" \
    "$REPO_ROOT"
echo "Done: thaz-java-25:latest"
