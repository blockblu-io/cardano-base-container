amd64:
	docker build --no-cache \
			--platform linux/amd64 \
			--build-arg C_UBUNTU_IMG=${UBUNTU} \
			--build-arg GHC_VERSION=${GHC} \
			--build-arg CABAL_VERSION=${CABAl} \
			-t "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_amd64" .
	docker push "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_amd64"

arm:
	docker build --no-cache \
			--platform linux/arm/v7 \
			--build-arg C_UBUNTU_IMG=${UBUNTU} \
			--build-arg GHC_VERSION=${GHC} \
			--build-arg CABAL_VERSION=${CABAl} \
			-t "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_arm" .
	docker push "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_arm"

arm64:
	docker build --no-cache \
			--platform linux/arm64/v8 \
			--build-arg C_UBUNTU_IMG=${UBUNTU} \
			--build-arg GHC_VERSION=${GHC} \
			--build-arg CABAL_VERSION=${CABAl} \
			-t "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_arm64" .
	docker push "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_arm64"

manifest:
	docker manifest create "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_amd64" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_arm" \
		"adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}_arm64"
	docker manifest push --purge "adalove/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAl}"

all: amd64 arm arm64 manifest