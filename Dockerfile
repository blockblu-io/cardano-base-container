ARG C_UBUNTU_IMG
FROM alpine/git AS cloner

WORKDIR /
RUN git clone https://github.com/input-output-hk/libsodium.git && \
	cd libsodium && \
	git checkout 66f017f1 --quiet

FROM ubuntu:${C_UBUNTU_IMG}

# install dependencies 
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		autoconf \
		automake \
		build-essential \
		ca-certificates \
		libncursesw5 \
		libtool \
		make \
		netbase \
		pkg-config && \
	rm -rf /var/lib/apt/lists/*

# install library libsodium
COPY --from=cloner /libsodium /libsodium
RUN cd libsodium && \
	./autogen.sh && ./configure && \
	make && make check && make install && \
	rm -rf ../libsodium

# set environment variables for installed libsodium
ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
ENV PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# Documentation
LABEL maintainer="Kevin Haller <keivn.haller@outofbits.com>"
LABEL version="${C_UBUNTU_IMG}"
LABEL description="Ubuntu ${C_UBUNTU_IMG} Image customized to be ready to run Cardano applications."

ENTRYPOINT [ "/bin/bash" ]