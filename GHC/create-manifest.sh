#!/bin/bash

docker manifest create "adalove/ubuntu:$1-ghc$2-c$3" \
	"adalove/ubuntu:$1-ghc$2-c$3_amd64" \
	"adalove/ubuntu:$1-ghc$2-c$3_arm" \
	"adalove/ubuntu:$1-ghc$2-c$3_arm64"

docker manifest push --purge "adalove/ubuntu:$1-ghc$2-c$3"