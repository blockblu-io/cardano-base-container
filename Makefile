amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg C_UBUNTU_IMG=$(UBUNTU) \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:$(UBUNTU)_amd64" .
	docker push "blockblu/ubuntu:$(UBUNTU)_amd64"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg C_UBUNTU_IMG=$(UBUNTU) \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:$(UBUNTU)_arm64" .
	docker push "blockblu/ubuntu:$(UBUNTU)_arm64"

manifest:
	docker manifest create "blockblu/ubuntu:$(UBUNTU)" \
		"blockblu/ubuntu:$(UBUNTU)_amd64" \
		"blockblu/ubuntu:$(UBUNTU)_arm64"
	docker manifest push --purge "blockblu/ubuntu:$(UBUNTU)"

all: amd64 arm64 manifest