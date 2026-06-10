#!/usr/bin/env bash
set -euo pipefail

MAVEN_VERSION=3.9.16

MAVEN_INSTALLER=$(mktemp)
trap 'rm -f "$MAVEN_INSTALLER"' EXIT

curl -fsSL "https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -o "$MAVEN_INSTALLER"

tar -xzf "$MAVEN_INSTALLER" -C /usr/local
ln -sf "/usr/local/apache-maven-${MAVEN_VERSION}/bin/mvn" /usr/local/bin/mvn
