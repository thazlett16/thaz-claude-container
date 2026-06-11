FROM thaz-base:latest

USER root

ENV GOLANG_VERSION=1.23.4

# ── Go ────────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/go,target=/scripts \
    bash /scripts/install-go.sh "$GOLANG_VERSION"

ENV PATH=/usr/local/go/bin:$PATH

USER developer
WORKDIR /workspace
