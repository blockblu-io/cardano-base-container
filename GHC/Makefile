amd64:
	docker build \
		--platform linux/amd64 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--build-arg GHC_VERSION=${GHC} \
		--build-arg CABAL_VERSION=${CABAL} \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" .
#	docker push "blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64"

arm64:
	docker build \
		--platform linux/arm64/v8 \
		--build-arg C_UBUNTU_IMG=${UBUNTU} \
		--build-arg GHC_VERSION=${GHC} \
		--build-arg CABAL_VERSION=${CABAL} \
		--no-cache \
		--pull \
		-t "blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64" .
#	docker push "blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"

manifest:
	docker manifest create "blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}" \
		"blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" \
		"blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"
	docker manifest push --purge "blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}"

manifest-latest:
	docker manifest create "blockblu/ubuntu:${UBUNTU}-ghc" \
		"blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" \
		"blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"
	docker manifest push --purge "blockblu/ubuntu:${UBUNTU}-ghc"
	docker manifest create "blockblu/ubuntu:ghc" \
		"blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_amd64" \
		"blockblu/ubuntu:${UBUNTU}-ghc${GHC}-c${CABAL}_arm64"
#	docker manifest push --purge "blockblu/ubuntu:ghc"

all: amd64 arm64 manifest