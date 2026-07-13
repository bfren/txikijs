#!/bin/sh

set -eu

# script receives one argument: the txikijs version
TXIKIJS=${1}

# clone source
git clone \
    --depth 1 \
    --branch v${TXIKIJS} \
    --single-branch \
    --recursive https://github.com/saghul/txiki.js \
    --shallow-submodules

# apply patches
