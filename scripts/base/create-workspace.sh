#!/usr/bin/env bash
set -euo pipefail

user_name="$1";
workspace="$2";

mkdir -p "$workspace"
chown "$user_name:$user_name" "$workspace";
