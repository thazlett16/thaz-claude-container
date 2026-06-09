FROM thaz-base:latest

USER root

ENV JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64
ENV MAVEN_VERSION=3.9.16
ENV MAVEN_HOME=/usr/local/apache-maven-${MAVEN_VERSION}

# ── JDK 21 ───────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-jdk25.sh

# ── Maven ─────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-maven.sh "$MAVEN_VERSION"

USER developer
WORKDIR /workspace
