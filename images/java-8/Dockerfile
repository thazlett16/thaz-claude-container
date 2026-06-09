FROM thaz-base:latest

USER root

ENV JAVA_HOME=/usr/lib/jvm/temurin-8-amd64
ENV MAVEN_VERSION=3.9.16
ENV MAVEN_HOME=/usr/local/apache-maven-${MAVEN_VERSION}

# ── JDK 8 (Eclipse Temurin / Adoptium) ───────────────────────────────────────
RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-jdk8.sh

# ── Maven ─────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/java,target=/scripts \
    bash /scripts/install-maven.sh $MAVEN_VERSION

USER developer
WORKDIR /workspace
