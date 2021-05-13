# Cardano Base Images (Ubuntu)

This repository provides a basic Dockerfile for creating Ubuntu images that have the IOHK fork of libsodium installed. Hence, it is ready to be used with `cardano-node` binaries, but also community tools such as `cncli`. 

You can find prebuilt images on [Dockerhub](https://hub.docker.com/repository/docker/adalove/cncli). The tag of the latest build is `adalove/ubuntu`.

## Development Images

This repository also contains a number of Dockerfiles that build images for specific development/compilation environments based on the Ubuntu base images.

* [GHC Development Images](GHC/README.md)
* [Rust Development Images](Rust/README.md)
