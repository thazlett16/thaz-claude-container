FROM thaz-base:latest

# Rust installs to ~/.rustup and ~/.cargo in developer's home dir
# USER developer inherited from base
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y

ENV PATH="/home/developer/.cargo/bin:$PATH"

WORKDIR /workspace
