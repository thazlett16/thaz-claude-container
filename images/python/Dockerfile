FROM thaz-base:latest

USER root

# ── Python ────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/python,target=/scripts \
    bash /scripts/install-python.sh

# ── pipx ─────────────────────────────────────────────────────────────────────
RUN --mount=type=bind,source=scripts/python,target=/scripts \
    bash /scripts/install-pipx.sh

# ── Poetry ────────────────────────────────────────────────────────────────────
USER developer
ENV PATH="/home/developer/.local/bin:$PATH"

RUN --mount=type=bind,source=scripts/python,target=/scripts \
    bash /scripts/install-poetry.sh

WORKDIR /workspace
