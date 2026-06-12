#!/usr/bin/env bash
set -euo pipefail

CURRENT_IMAGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${CURRENT_IMAGE_ROOT}/../.." && pwd)"
COMPOSE_FILE="$CURRENT_IMAGE_ROOT/docker-compose.yaml"

if ! docker image inspect thaz-base:latest > /dev/null 2>&1; then
    echo "Base image not found — building it first..."
    docker compose -f "$COMPOSE_FILE" build base
fi

echo "Mounting container based on thaz-base..."
docker compose -f "$COMPOSE_FILE" run --rm base
