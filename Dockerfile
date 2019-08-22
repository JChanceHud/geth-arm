FROM alpine:edge
MAINTAINER Chance Hudson

RUN apk add --no-cache git make gcc go musl-dev linux-headers
WORKDIR /tmp
RUN git clone --single-branch --branch release/1.9 https://github.com/ethereum/go-ethereum
WORKDIR /tmp/go-ethereum 
RUN make geth && cp build/bin/geth /usr/bin/geth

WORKDIR /root

RUN rm -rf /tmp/go-ethereum
