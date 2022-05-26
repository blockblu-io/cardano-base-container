ARG C_UBUNTU_IMG

# helper image for building libsodium 
FROM ubuntu:${C_UBUNTU_IMG} AS libBuilder

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        ca-certificates \
        git \
        libtool \
        make \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN git clone https://github.com/input-output-hk/libsodium.git \
    && cd libsodium \
    && git checkout -f 66f017f1 --quiet \
    && ./autogen.sh \
    && ./configure --disable-silent-rules --disable-opt \
    && make \
    && make check \
    && make install \
    && rm -rf ../libsodium

RUN git clone https://github.com/blockblu-io/secp256k1.git \
    && cd secp256k1 \
    && git checkout -f ac83be33 --quiet \
    && ./autogen.sh \
    && ./configure --disable-silent-rules \
            --disable-opt \
            --enable-module-schnorrsig \
            --enable-experimental \
    && make \
    && make check \
    && make install \
    && rm -rf ../secp256k1

ENTRYPOINT [ "/bin/bash" ]

# main image
FROM ubuntu:${C_UBUNTU_IMG}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        netbase \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY --from=libBuilder /usr/local/lib/libsodium.so.23 /usr/lib
COPY --from=libBuilder /usr/local/lib/libsecp256k1.so.0 /usr/lib

LABEL maintainer="Kevin Haller <keivn.haller@blockblu.io>"
LABEL version="${C_UBUNTU_IMG}"
LABEL description="Ubuntu ${C_UBUNTU_IMG} image customized to be ready to run Cardano applications."

ENTRYPOINT [ "/bin/bash" ]