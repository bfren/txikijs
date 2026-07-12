#!/bin/sh

set -eu

# build 
cd txiki.js
make

# move binary to root
mv ./build/tjs /
