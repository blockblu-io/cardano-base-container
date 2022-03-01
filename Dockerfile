ARG C_UBUNTU_IMG

# helper image for building libsodium 
FROM ubuntu:${C_UBUNTU_IMG} AS libsodiumBuilder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        ca-certificates \
        git \
        libtool \
        make \
        pkg-config && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN git clone https://github.com/input-output-hk/libsodium.git && \
    cd libsodium && \
    git checkout 66f017f1 --quiet

RUN cd libsodium && \
    ./autogen.sh && ./configure && \
    make && make check && make install && \
    rm -rf ../libsodium

ENTRYPOINT [ "/bin/bash" ]

# main image
FROM ubuntu:${C_UBUNTU_IMG}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        netbase \
        pkg-config && \
    rm -rf /var/lib/apt/lists/*

COPY --from=libsodiumBuilder /usr/local/lib/libsodium.so.23 /usr/lib

LABEL maintainer="Kevin Haller <keivn.haller@blockblu.io>"
LABEL version="${C_UBUNTU_IMG}"
LABEL description="Ubuntu ${C_UBUNTU_IMG} image customized to be ready to run Cardano applications."

ENTRYPOINT [ "/bin/bash" ]