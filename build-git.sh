#!/bin/bash

docker build -f GIT.Dockerfile \
	--platform linux/amd64 \
	--no-cache \
	--pull \
	-t "adalove/ubuntu:git_amd64" .

docker push "adalove/ubuntu:git_amd64"

docker build -f GIT.Dockerfile \
	--platform linux/arm/v7 \
	--no-cache \
	--pull \
	-t "adalove/ubuntu:git_arm" .

docker push "adalove/ubuntu:git_arm"

docker build -f GIT.Dockerfile \
	--platform linux/arm64/v8 \
	--no-cache \
	--pull \
	-t "adalove/ubuntu:git_arm64" .

docker push "adalove/ubuntu:git_arm64"

docker manifest rm "adalove/ubuntu:git"

docker manifest create "adalove/ubuntu:git" \
	"adalove/ubuntu:git_amd64" \
	"adalove/ubuntu:git_arm" \
	"adalove/ubuntu:git_arm64"

docker manifest push --purge "adalove/ubuntu:git"