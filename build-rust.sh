#!/bin/bash
FAIL=0
if [ -z $1 ]; then
    echo "error: the Ubuntu version is not specified (from which the image shall be built)"
    FAIL=1
fi
if [ -z $2 ]; then
    echo "error: the Rust version must be specified"
    FAIL=1
fi
if [ $FAIL -ne 0 ]; then
    echo "usage: $0 <ubuntu-version-number> <rust-version>"
    exit 1
fi

docker build -f Rust.Dockerfile --build-arg C_UBUNTU_IMG=$1 --build-arg RUST_VERSION=$2 --no-cache --pull -t "adalove/ubuntu:$1-rust$2" .