#!/usr/bin/env bash
set -euo pipefail

user_uid="$1";
user_gid="$2";
user_name="$3";
workspace="$4";

groupadd --gid "$user_gid" "$user_name";
useradd --uid "$user_uid" --gid "$user_gid" --create-home --shell /bin/bash "$user_name";

mkdir -p "$workspace"
chown "$user_name:$user_name" "$workspace";

# https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file
usermod -aG sudo "$user_name";
echo "$user_name ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user_name;
#echo "$user_name ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$user_name;
chmod 0440 /etc/sudoers.d/$user_name
