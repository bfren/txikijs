ARG ALPINE=3.24.1

# use target Alpine version as host
FROM alpine:${ALPINE} AS build

# define ARGS
ARG TXIKIJS=26.6.0

# install prerequisites
RUN apk add alpine-sdk cmake libffi-dev

# copy script files
WORKDIR /tmp
COPY ./download.sh .
COPY ./build.sh .

# download source
RUN chmod +x ./download.sh && ./download.sh ${TXIKIJS}

# build
RUN chmod +x ./build.sh && ./build.sh

# create blank image with only txikijs binary
FROM scratch AS final
COPY --from=build /tjs /
