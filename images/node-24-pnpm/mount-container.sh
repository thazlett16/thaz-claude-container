#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

if ! docker image inspect thaz-node-24-pnpm:latest > /dev/null 2>&1; then
    echo "Base image not found — building it first..."
    bash "$REPO_ROOT/images/node-24-pnpm/create-image.sh"
fi

echo "Mounting container based on thaz-node-24-pnpm..."
docker run \
    -it \
    --rm \
    thaz-node-24-pnpm:latest
