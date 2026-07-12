# txiki.js

[txiki.js](https://txikijs.org) compiled for different Alpine &amp; Debian versions.

## Matrix

### Alpine

| txiki.js     | 3.15        | 3.16          | 3.17          | 3.18          | 3.19          | 3.20          | 3.21          | 3.22          | 3.23          | 3.24          |
| ------------ | :---------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| **26.6.0**   | &check;     | &check;       | &check;       | &check;       | &check;       | &check;       | &check;       | &check;       | &check;       | &check;       |

### Debian

| txiki.js     | 11 (bullseye) | 12 (bookworm) | 13 (trixie) |
| ------------ | :-----------: | :-----------: | :---------: |
| **26.6.0**   | &check;       | &check;       | &check;     |

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