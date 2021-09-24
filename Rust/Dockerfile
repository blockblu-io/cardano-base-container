ARG C_UBUNTU_IMG
FROM blockblu/ubuntu:${C_UBUNTU_IMG}

ARG RUST_VERSION

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        curl \
        libtool \
        make \
        wget && \
    rm -rf /var/lib/apt/lists/*

ADD https://sh.rustup.rs rustup.sh
RUN chmod +x  rustup.sh && \
    ./rustup.sh -y --default-toolchain ${RUST_VERSION}

ENV PATH="${PATH}:/root/.cargo/bin"

# Documentation
LABEL maintainer="Kevin Haller <keivn.haller@blockblu.io>"
LABEL version="${C_UBUNTU_IMG}-rust${RUST_VERSION}"
LABEL description="Ubuntu ${C_UBUNTU_IMG} image with Rust ${RUST_VERSION} and Cardano-ready."