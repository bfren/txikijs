#!/bin/sh

TXIKIJS=${1:-26.6.0}

docker buildx build \
    --build-arg TXIKIJS=${TXIKIJS} \
    .
