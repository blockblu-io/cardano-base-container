ARG C_UBUNTU_IMG
FROM blockblu/ubuntu:${C_UBUNTU_IMG}

ARG CABAL_VERSION
ARG GHC_VERSION

ENV PATH="/root/.cabal/bin:${PATH}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        automake \
        build-essential \
        cabal-install \
        ghc \
        git \
        g++ \
        curl \
        wget \
        libffi-dev \
        libgmp-dev \
        libssl-dev \
        libsystemd-dev \
        libtinfo-dev \
        llvm-10* \
        python3 \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/lib/llvm-10/bin:$PATH"
ENV CPLUS_INCLUDE_PATH="$(llvm-config --includedir):$CPLUS_INCLUDE_PATH"
ENV LD_LIBRARY_PATH="$(llvm-config --libdir):$LD_LIBRARY_PATH"

RUN cabal v2-update && \
    echo "" | cabal new-repl -w ghc-8.6.5 --build-dep fail && \
    cabal v2-install cabal-install --constraint "cabal == ${CABAL_VERSION}.0.0" && \
    cabal v2-install alex happy --constraint 'happy == 1.19.12'

RUN git clone https://gitlab.haskell.org/ghc/ghc.git && \
    cd ghc && \
    git fetch --all --tags && \
    git checkout tags/ghc-$GHC_VERSION-release --quiet && \
    git submodule update --init && \
    ./boot && \
    ./configure && \
    make && \
    make install && \
    rm -rf ../ghc

# Documentation
LABEL maintainer="Kevin Haller <keivn.haller@blockblu.io>"
LABEL version="${C_UBUNTU_IMG}-ghc$GHC_VERSION-c$CABAL_VERSION"
LABEL description="Ubuntu ${C_UBUNTU_IMG} image ready to compile the Cardano Node."

ENTRYPOINT [ "ghci" ]