#!/bin/bash

set -e

FAIL=0
if [ -z $1 ]; then
    echo "error: the Ubuntu version is not specified (from which the image shall be built)"
    FAIL=1
fi
if [ -z $2 ]; then
    echo "error: the GHC version must be specified"
    FAIL=1
fi
if [ -z $3 ]; then
    echo "error: the CABAL version must be specified"
    FAIL=1
fi
if [ $FAIL -ne 0 ]; then
    echo "usage: $0 <ubuntu-version-number> <ghc-version> <cabal-version>"
    exit 1
fi


docker build --no-cache \
        --platform linux/arm/v7 \
        --build-arg C_UBUNTU_IMG=$1 \
        --build-arg GHC_VERSION=$2 \
        --build-arg CABAL_VERSION=$3 \
        -t "adalove/ubuntu:$1-ghc$2-c$3_arm" .

docker push "adalove/ubuntu:$1-ghc$2-c$3_arm"



