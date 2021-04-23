#!/bin/bash
if [ -z $1 ]; then
    echo "error: the Ubuntu version is not specified (from which the image shall be built)"
    echo "usage: $0 <ubuntu-version-number>"
    exit 1
fi

docker build -f Base.Dockerfile \
	--platform linux/amd64 \
	--build-arg C_UBUNTU_IMG=$1 \
	--no-cache \
	--pull \
	-t "adalove/ubuntu:$1_amd64" .

docker push "adalove/ubuntu:$1_amd64"

docker build -f Base.Dockerfile \
	--platform linux/arm/v7 \
	--build-arg C_UBUNTU_IMG=$1 \
	--no-cache \
	--pull \
	-t "adalove/ubuntu:$1_arm" .

docker push "adalove/ubuntu:$1_arm"

docker build -f Base.Dockerfile \
	--platform linux/arm64/v8 \
	--build-arg C_UBUNTU_IMG=$1 \
	--no-cache \
	--pull \
	-t "adalove/ubuntu:$1_arm64" .

docker push "adalove/ubuntu:$1_arm64"

docker manifest create "adalove/ubuntu:$1" \
	"adalove/ubuntu:$1_amd64" \
	"adalove/ubuntu:$1_arm" \
	"adalove/ubuntu:$1_arm64"

docker manifest push --purge "adalove/ubuntu:$1"

exit 0