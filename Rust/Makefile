amd64:
	docker build \
    	--platform linux/amd64 \
    	--build-arg C_UBUNTU_IMG=${UBUNTU} \
    	--build-arg RUST_VERSION=${RUST} \
    	--no-cache \
    	--pull \
    	-t "adalove/ubuntu:${UBUNTU}-rust${RUST}_amd64" .
	docker push "adalove/ubuntu:${UBUNTU}-rust${RUST}_amd64"

arm64:
	docker build \
    	--platform linux/arm64/v8 \
    	--build-arg C_UBUNTU_IMG=${UBUNTU} \
    	--build-arg RUST_VERSION=${RUST} \
    	--no-cache \
    	--pull \
    	-t "adalove/ubuntu:${UBUNTU}-rust${RUST}_arm64" .
	docker push "adalove/ubuntu:${UBUNTU}-rust${RUST}_arm64"

manifest:
	docker manifest create "adalove/ubuntu:${UBUNTU}-rust${RUST}" \
		"adalove/ubuntu:${UBUNTU}-rust${RUST}_amd64" \
		"adalove/ubuntu:${UBUNTU}-rust${RUST}_arm64"
	docker manifest push --purge "adalove/ubuntu:${UBUNTU}-rust${RUST}"

manifest-latest:
	docker manifest create "adalove/ubuntu:${UBUNTU}-rust" \
		"adalove/ubuntu:${UBUNTU}-rust${RUST}_amd64" \
		"adalove/ubuntu:${UBUNTU}-rust${RUST}_arm64"
	docker manifest push --purge "adalove/ubuntu:${UBUNTU}-rust"
	docker manifest create "adalove/ubuntu:rust" \
		"adalove/ubuntu:${UBUNTU}-rust${RUST}_amd64" \
		"adalove/ubuntu:${UBUNTU}-rust${RUST}_arm64"
	docker manifest push --purge "adalove/ubuntu:rust"

all: amd64 arm64 manifest