FROM thaz-base:latest

USER root

# ── JDK 21 ───────────────────────────────────────────────────────────────────
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends openjdk-21-jdk; \
    apt-get dist-clean

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

# ── Maven ─────────────────────────────────────────────────────────────────────
ENV MAVEN_VERSION=3.9.14
RUN set -eux; \
    curl -fsSL "https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
    | tar -C /usr/local -xz; \
    ln -s "/usr/local/apache-maven-${MAVEN_VERSION}/bin/mvn" /usr/local/bin/mvn

ENV MAVEN_HOME=/usr/local/apache-maven-${MAVEN_VERSION}

USER developer
WORKDIR /workspace
