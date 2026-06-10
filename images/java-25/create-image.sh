#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-java-25..."
docker build \
    -f "$REPO_ROOT/images/java-25/Dockerfile" \
    -t "thaz-java-25:latest" \
    "$REPO_ROOT"
echo "Done: thaz-java-25:latest"
