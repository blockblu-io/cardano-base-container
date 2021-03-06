amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg C_UBUNTU_IMG=$(UBUNTU) \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:$(UBUNTU)_amd64" .
	docker push "blockblu/ubuntu:$(UBUNTU)_amd64"

amd64-devel:
	docker build -f Dockerfile.devel \
		--platform linux/amd64 \
		--build-arg C_UBUNTU_IMG=$(UBUNTU) \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:$(UBUNTU)-devel_amd64" .
	docker push "blockblu/ubuntu:$(UBUNTU)-devel_amd64"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg C_UBUNTU_IMG=$(UBUNTU) \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:$(UBUNTU)_arm64" .
	docker push "blockblu/ubuntu:$(UBUNTU)_arm64"

arm64-devel:
	docker build -f Dockerfile.devel \
		--platform linux/arm64/v8 \
		--build-arg C_UBUNTU_IMG=$(UBUNTU) \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:$(UBUNTU)-devel_arm64" .
	docker push "blockblu/ubuntu:$(UBUNTU)-devel_arm64"

manifest:
	docker manifest create "blockblu/ubuntu:$(UBUNTU)" \
		"blockblu/ubuntu:$(UBUNTU)_amd64" \
		"blockblu/ubuntu:$(UBUNTU)_arm64"
	docker manifest push --purge "blockblu/ubuntu:$(UBUNTU)"

manifest-devel:
	docker manifest create "blockblu/ubuntu:$(UBUNTU)-devel" \
		"blockblu/ubuntu:$(UBUNTU)-devel_amd64" \
		"blockblu/ubuntu:$(UBUNTU)-devel_arm64"
	docker manifest push --purge "blockblu/ubuntu:$(UBUNTU)-devel"

all: amd64 arm64 manifest