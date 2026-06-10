#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-java-21..."
docker build \
    -f "$REPO_ROOT/images/java-21/Dockerfile" \
    -t "thaz-java-21:latest" \
    "$REPO_ROOT"
echo "Done: thaz-java-21:latest"
