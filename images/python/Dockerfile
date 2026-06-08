FROM thaz-base:latest

# Python 3 is already installed in base.
# This image adds pipx and Poetry for Python project management.

USER root
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends pipx; \
    apt-get dist-clean

USER developer
ENV PATH="/home/developer/.local/bin:$PATH"

RUN pipx install poetry

WORKDIR /workspace
