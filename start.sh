#!/usr/bin/env bash
set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────────────
IMAGE_NAME="thaz-claude"
CONTAINER_NAME="claude-dev"

# Directory on the host to mount as /workspace inside the container.
# Defaults to the current working directory; override with: ./start.sh /path/to/project
WORKSPACE_DIR="${1:-$PWD}"

# ── Build ─────────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building image ${IMAGE_NAME}..."
echo "SCRIPT_DIR ${SCRIPT_DIR}"
DOCKER_BUILDKIT=1 docker build -t "${IMAGE_NAME}" "${SCRIPT_DIR}"

# ── Run ───────────────────────────────────────────────────────────────────────
DOCKER_ARGS=(
  --rm
  --interactive
  --tty
  --name "${CONTAINER_NAME}"

  # Mount workspace
  --volume "${WORKSPACE_DIR}:/workspace"

  # Mount Claude Code settings directory (auth, memory, hooks, settings.json)
  --volume "${HOME}/.claude:/root/.claude"
)

# Mount ~/.claude.json if it exists (stores auth token / global config)
if [[ -f "${HOME}/.claude.json" ]]; then
  DOCKER_ARGS+=(--volume "${HOME}/.claude.json:/root/.claude.json")
fi

# Forward ANTHROPIC_API_KEY if set in the host environment
if [[ -n "${ANTHROPIC_API_KEY:-}" ]]; then
  DOCKER_ARGS+=(--env "ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}")
fi

echo "Starting container '${CONTAINER_NAME}' with workspace: ${WORKSPACE_DIR}"
docker run "${DOCKER_ARGS[@]}" "${IMAGE_NAME}" bash