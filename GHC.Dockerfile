ARG C_UBUNTU_IMG
FROM adalove/ubuntu:${C_UBUNTU_IMG}

ARG CABAL_VERSION
ARG GHC_VERSION

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ghc \
		cabal-install \
		git \
		g++ \
		curl \
		wget \
 		libffi-dev \
		libgmp-dev \
		libssl-dev \
		libsystemd-dev \
		libtinfo-dev \
		python3 \
		zlib1g-dev && \
	rm -rf /var/lib/apt/lists/*

RUN cabal v2-update && \
	echo "" | cabal new-repl -w ghc-8.6.5 --build-dep fail && \
	cabal v2-install cabal-install --constraint "cabal == ${CABAL_VERSION}.0.0" && \
	cabal v2-install alex happy --constraint 'happy == 1.19.12'

ENV PATH="/root/.cabal/bin:${PATH}"

RUN git clone https://gitlab.haskell.org/ghc/ghc.git && \
	cd ghc && \
	git fetch --all --tags && \
    git checkout tags/ghc-$GHC_VERSION-release --quiet && \
	git submodule update --init && \
	./boot && \
	./configure && \
	make && \
	make install

# Documentation
LABEL maintainer="Kevin Haller <keivn.haller@outofbits.com>"
LABEL version="${C_UBUNTU_IMG}-ghc$GHC_VERSION-c$CABAL_VERSION"
LABEL description="Ubuntu ${C_UBUNTU_IMG} Image ready to compile the Cardano Node."

ENTRYPOINT [ "ghci" ]