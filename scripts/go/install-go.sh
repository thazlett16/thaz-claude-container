#!/usr/bin/env bash
set -euo pipefail

GOLANG_VERSION="${1:?GOLANG_VERSION argument is required}"

curl -fsSL "https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" \
    | tar -C /usr/local -xz
