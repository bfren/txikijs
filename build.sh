#!/bin/sh

set -eu

# build 
cd txiki.js
cmake -B build-slim \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WITH_WASM=OFF \
    -DBUILD_WITH_SQLITE=OFF \
    -DBUILD_WITH_LTO=ON \
    -DBUILD_WITH_GC_SECTIONS=ON \
    -DBUILD_WITH_STRIP=ON \
    -DCMAKE_EXE_LINKER_FLAGS="-static" \
    -DFFI_LIB=/usr/lib/libffi.a
cmake --build build-slim

# move binary to root
mv ./build-slim/tjs /
