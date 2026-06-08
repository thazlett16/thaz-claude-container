FROM thaz-base:latest

USER root

# ── Go ────────────────────────────────────────────────────────────────────────
ENV GOLANG_VERSION=1.23.4

RUN curl -fsSL "https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz" \
    | tar -C /usr/local -xz

ENV PATH=/usr/local/go/bin:$PATH

USER developer
WORKDIR /workspace
