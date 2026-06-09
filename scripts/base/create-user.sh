#!/usr/bin/env bash
set -euo pipefail

user_uid="$1";
user_gid="$2";
user_name="$3";

groupadd --gid "$user_gid" "$user_name";
useradd --uid "$user_uid" --gid "$user_gid" --create-home --shell /bin/bash "$user_name";
