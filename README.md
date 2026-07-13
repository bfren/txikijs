# txiki.js

[txiki.js](https://txikijs.org) compiled and statically-linked.

## Usage

You can find live examples in my [Debian Docker image](https://github.com/bfren/docker-debian).

```Dockerfile
# set Debian version
ARG DEBIAN=13.5
ARG VERSION=260712

# use tags to load correct version of txiki.js for your Debian version
FROM ghcr.io/bfren/txikijs:26.6.0-debian${DEBIAN}-${VERSION} AS tjs

# load the same the version of Debian
FROM debian:${DEBIAN}-slim AS build

# copy txiki.js executable to /bin
COPY --from=tjs / /bin

# rest of Dockerfile
```