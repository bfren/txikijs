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

# the correct, portable format specifier for size_t in C is %zu, not %lu
# fixes the following build error:
# format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
sed -i 's/%lu", typesz/%zu", typesz/' txiki.js/src/mod_ffi.c

