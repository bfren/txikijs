# txiki.js

[txiki.js](https://txikijs.org) compiled and statically-linked.

## Usage

You can find live examples in my [Debian Docker image](https://github.com/bfren/docker-debian).

```Dockerfile
ARG VERSION=260901

# use tags to load correct version of txiki.js for your Debian version
FROM ghcr.io/bfren/txikijs:26.6.0-${VERSION} AS tjs

# load the base image
FROM debian:13.7-slim AS build

# copy txiki.js executable to /bin
COPY --from=tjs / /bin

# rest of Dockerfile
```
