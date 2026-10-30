# txiki.js

[txiki.js](https://txikijs.org) - a small JavaScript runtime built on QuickJS-ng and libuv - compiled and statically
linked against musl, so one binary runs across every Alpine and Debian image in my
[Docker ecosystem](https://github.com/bfren/docker).

- **Source:** the release tag `v<txikijs>` cloned from [txiki.js on GitHub](https://github.com/saghul/txiki.js),
  with its submodules.
- **Build:** a `Release` build with WASM and FFI support disabled, unused sections removed and the binary
  stripped - see [build.sh](build.sh).
- **Static:** linked with `-static` against musl on Alpine, so it runs on any Alpine or Debian version (and any other
  Linux) without needing matching libraries.

Each image contains only the `tjs` executable, at `/tjs`.

## Matrix

| txiki.js   | amd64   | arm64   | arm/v7  |
| ---------- | :-----: | :-----: | :-----: |
| **26.6.0** | &check; | &check; | &check; |

## Tags

Images are published to `quay.io/bfren-bin/txikijs`:

| Tag                | Example          |
| ------------------ | ---------------- |
| `TXIKIJS-VERSION`  | `26.6.0-261030`  |

`VERSION` is the build date (`yymmdd`) in [VERSION](VERSION) - pin it to get exactly the same binary every time.

> [!NOTE]
> Before version `261030`, images were published to `ghcr.io/bfren/txikijs` (and earlier with tags for each Debian
> version, like `26.6.0-debian13.5-260712`). Those images remain available but will not be updated.

## Adding a release

1. Add the version to both `txikijs` matrices in the [build workflow](.github/workflows/build.yml), update the
   `TXIKIJS` defaults in [Dockerfile](Dockerfile) and [test.sh](test.sh), and add it to the matrix above.
2. Set [VERSION](VERSION) to today's date (`yymmdd`).
3. Run `./test.sh <txikijs>` to check it builds, then run the `build` workflow.

## Usage

```Dockerfile
# load txiki.js
FROM quay.io/bfren-bin/txikijs:26.6.0-261030 AS tjs

# use any version of Alpine or Debian
FROM debian:13.7-slim AS build

# copy txiki.js executable to /bin
COPY --from=tjs / /bin

# rest of Dockerfile
```

## Licence

The build scripts in this repository are released under the [MIT licence](https://mit.bfren.dev/2026).

txiki.js is licensed under the [MIT licence](https://github.com/saghul/txiki.js/blob/master/LICENSE), and bundles
third-party libraries under their own licences - all of which cover the binary in the published images.

## Copyright

> Copyright (c) 2026 bfren (unless otherwise stated)
