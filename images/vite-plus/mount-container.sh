#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

if ! docker image inspect thaz-vite-plus:latest > /dev/null 2>&1; then
    echo "Base image not found — building it first..."
    bash "$REPO_ROOT/images/vite-plus/create-image.sh"
fi

echo "Mounting container based on thaz-vite-plus..."
docker run \
    -it \
    --rm \
    thaz-vite-plus:latest
