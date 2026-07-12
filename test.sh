#!/bin/sh

ALPINE=${1:-3.24.1}
TXIKIJS=${2:-26.6.0}

docker buildx build \
    -f Dockerfile.alpine \
    --build-arg ALPINE=${ALPINE} \
    --build-arg TXIKIJS=${TXIKIJS} \
    .
