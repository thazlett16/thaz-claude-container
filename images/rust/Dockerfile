FROM thaz-base:latest

# Rust installs to ~/.rustup and ~/.cargo in developer's home dir.
# USER developer inherited from base.
RUN --mount=type=bind,source=scripts/rust,target=/scripts \
    bash /scripts/install-rust.sh

ENV PATH="/home/developer/.cargo/bin:$PATH"

WORKDIR /workspace
