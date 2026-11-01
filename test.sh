#!/bin/sh

TXIKIJS=${1:-26.11.0}

docker buildx build \
    --build-arg TXIKIJS=${TXIKIJS} \
    .
