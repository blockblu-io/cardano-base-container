amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--build-arg GHC_VERSION=${GHC} \
		--build-arg CABAL_VERSION=${CABAL} \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" .
	docker push "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64"

arm:
	docker build \
		--platform linux/arm/v7 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--build-arg GHC_VERSION=${GHC} \
		--build-arg CABAL_VERSION=${CABAL} \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm" .
	docker push "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--build-arg GHC_VERSION=${GHC} \
		--build-arg CABAL_VERSION=${CABAL} \
		--no-cache \
		--pull \
		-t "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64" .
	docker push "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"

manifest:
	docker manifest create "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"
	docker manifest push --purge "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}"

manifest-latest:
	docker manifest create "adalove/ubuntu:${UBUNTU}-ghc" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"
	docker manifest push --purge "adalove/ubuntu:${UBUNTU}-ghc"
	docker manifest create "adalove/ubuntu:ghc" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"
	docker manifest push --purge "adalove/ubuntu:ghc"

all: amd64 arm arm64 manifest