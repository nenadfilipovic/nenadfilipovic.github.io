## Base image
## -------------------------------------------------------------------

FROM debian:bullseye-slim

ENV VERSION='0.58.3'
ENV CHECKSUM="hugo_${VERSION}_checksums.txt"
ENV NAME="hugo_extended_${VERSION}_Linux-64bit.tar.gz"
ENV BASE_URL="https://github.com/gohugoio/hugo/releases/download"
ENV URL="${BASE_URL}/v${VERSION}/${NAME}"
ENV CHECKSUM_URL="${BASE_URL}/v${VERSION}/${CHECKSUM}"

## Set working directory.
WORKDIR /hugo

## Install:
## - git
## - ssh
## - wget
## - ca-certificatess
RUN apt-get update \
  && apt-get install --no-install-recommends -qq \
    git \
    wget \
    openssh-server \
    ca-certificates \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

## Install hugo.
RUN wget --quiet "${URL}" && wget --quiet "${CHECKSUM_URL}" \
  && grep "${NAME}" "./${CHECKSUM}" | sha256sum -c - \
  && tar -zxvf "${NAME}" \
  && mv ./hugo /usr/bin/hugo \
  && rm -rf /hugo

## Set working directory.
WORKDIR /src

## Set starting directory.
ENTRYPOINT [ "/usr/bin/hugo" ]
