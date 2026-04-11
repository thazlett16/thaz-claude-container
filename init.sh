#!/usr/bin/env bash
set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
IMAGE_NAME="thaz-claude"

# ── Build ─────────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building image ${IMAGE_NAME}..."
echo "SCRIPT_DIR ${SCRIPT_DIR}"
docker build -t "${IMAGE_NAME}" "${SCRIPT_DIR}"
