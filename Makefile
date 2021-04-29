amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:${UBUNTU}_amd64" .
	docker push "adalove/ubuntu:${UBUNTU}_amd64"

arm:
	docker build \
		--platform linux/arm/v7 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:${UBUNTU}_arm" .
	docker push "adalove/ubuntu:${UBUNTU}_arm"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:${UBUNTU}_arm64" .
	docker push "adalove/ubuntu:${UBUNTU}_arm64"

manifest:
	docker manifest create "adalove/ubuntu:${UBUNTU}" \
		"adalove/ubuntu:${UBUNTU}_amd64" \
		"adalove/ubuntu:${UBUNTU}_arm" \
		"adalove/ubuntu:${UBUNTU}_arm64"
	docker manifest push --purge "adalove/ubuntu:${UBUNTU}"

all: amd64 arm arm64 manifest