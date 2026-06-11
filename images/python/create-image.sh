#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"

echo "Building thaz-python..."
docker build \
    -f "$REPO_ROOT/images/python/Dockerfile" \
    -t "thaz-python:latest" \
    "$REPO_ROOT"
echo "Done: thaz-python:latest"
