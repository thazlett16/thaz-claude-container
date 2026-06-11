#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

if ! docker image inspect thaz-java-25:latest > /dev/null 2>&1; then
    echo "Base image not found — building it first..."
    bash "$REPO_ROOT/images/java-25/create-image.sh"
fi

echo "Mounting container based on thaz-java-25..."
docker run \
    -it \
    --rm \
    thaz-java-25:latest
