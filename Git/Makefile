
amd64:
	docker build \
		--platform linux/amd64 \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:git_amd64" .
	docker push "adalove/ubuntu:git_amd64"

arm:
	docker build \
		--platform linux/arm/v7 \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:git_arm" .
	docker push "adalove/ubuntu:git_arm"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:git_arm64" .
	docker push "adalove/ubuntu:git_arm64"

manifest-latest:
	docker manifest create "adalove/ubuntu:git" \
		"adalove/ubuntu:git_amd64" \
		"adalove/ubuntu:git_arm" \
		"adalove/ubuntu:git_arm64"
	docker manifest push --purge "adalove/ubuntu:git"
