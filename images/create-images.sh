#!/usr/bin/env bash
set -euo pipefail

IMAGES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$IMAGES_ROOT/base/create-image.sh"
bash "$IMAGES_ROOT/java-8/create-image.sh"
bash "$IMAGES_ROOT/java-21/create-image.sh"
bash "$IMAGES_ROOT/java-25/create-image.sh"
