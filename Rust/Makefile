amd64:
	docker build \
    	--platform linux/amd64 \
    	--build-arg C_UBUNTU_IMG=${UBUNTU} \
    	--build-arg RUST_VERSION=${RUST} \
    	--no-cache \
    	--pull \
    	-t "blockblu/ubuntu:${UBUNTU}-rust${RUST}_amd64" .
	docker push "blockblu/ubuntu:${UBUNTU}-rust${RUST}_amd64"

arm64:
	docker build \
    	--platform linux/arm64/v8 \
    	--build-arg C_UBUNTU_IMG=${UBUNTU} \
    	--build-arg RUST_VERSION=${RUST} \
    	--no-cache \
    	--pull \
    	-t "blockblu/ubuntu:${UBUNTU}-rust${RUST}_arm64" .
	docker push "blockblu/ubuntu:${UBUNTU}-rust${RUST}_arm64"

manifest:
	docker manifest create "blockblu/ubuntu:${UBUNTU}-rust${RUST}" \
		"blockblu/ubuntu:${UBUNTU}-rust${RUST}_amd64" \
		"blockblu/ubuntu:${UBUNTU}-rust${RUST}_arm64"
	docker manifest push --purge "blockblu/ubuntu:${UBUNTU}-rust${RUST}"

manifest-latest:
	docker manifest create "blockblu/ubuntu:${UBUNTU}-rust" \
		"blockblu/ubuntu:${UBUNTU}-rust${RUST}_amd64" \
		"blockblu/ubuntu:${UBUNTU}-rust${RUST}_arm64"
	docker manifest push --purge "blockblu/ubuntu:${UBUNTU}-rust"
	docker manifest create "blockblu/ubuntu:rust" \
		"blockblu/ubuntu:${UBUNTU}-rust${RUST}_amd64" \
		"blockblu/ubuntu:${UBUNTU}-rust${RUST}_arm64"
	docker manifest push --purge "blockblu/ubuntu:rust"

all: amd64 arm64 manifest