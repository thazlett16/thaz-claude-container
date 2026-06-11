#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

if ! docker image inspect thaz-base:latest > /dev/null 2>&1; then
    echo "Base image not found — building it first..."
    bash "$REPO_ROOT/images/base/create-image.sh"
fi

echo "Mounting container based on thaz-base..."
docker run \
    -it \
    --rm \
    thaz-base:latest
