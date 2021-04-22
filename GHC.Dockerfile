ARG C_UBUNTU_IMG
FROM adalove/ubuntu:${C_UBUNTU_IMG}

ARG CABAL_VERSION
ARG GHC_VERSION

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		gnupg && \
	rm -rf /var/lib/apt/lists/*

RUN echo "deb http://ppa.launchpad.net/hvr/ghc/ubuntu $(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2 | xargs) main" | tee -a /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 063DAB2BDC0B3F9FCEBC378BFF3AEACEF6F88286 && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		cabal-install-${CABAL_VERSION} \
		ghc-${GHC_VERSION} \
		ghc-${GHC_VERSION}-dyn \
		ghc-${GHC_VERSION}-prof \
		git \
		g++ \
		curl \
		wget \
 		libffi-dev \
		libgmp-dev \
		libssl-dev \
		libsystemd-dev \
		libtinfo-dev \
		zlib1g-dev && \
	rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/opt/ghc/bin"

# Documentation
LABEL maintainer="Kevin Haller <keivn.haller@outofbits.com>"
LABEL version="${C_UBUNTU_IMG}-ghc$GHC_VERSION-c$CABAL_VERSION"
LABEL description="Ubuntu ${C_UBUNTU_IMG} Image ready to compile the Cardano Node."

ENTRYPOINT [ "ghci" ]