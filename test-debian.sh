#!/bin/sh

DEBIAN=${1:-13.5}
TXIKIJS=${2:-26.6.0}

docker buildx build \
    -f Dockerfile.debian \
    --build-arg DEBIAN=${DEBIAN} \
    --build-arg TXIKIJS=${TXIKIJS} \
    .
