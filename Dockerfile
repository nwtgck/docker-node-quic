# (base: https://github.com/nodejs/node/blob/1ae0511b942c01c6e0adff98643d350a395bf101/.travis.yml)

FROM ubuntu:18.04

LABEL maintainer="Ryo Ota <nwtgck@nwtgck.org>"

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt update && \
    apt install -y \
      g++ \
      python \
      ccache \
      build-essential \
      git \
      python3-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV NODE_QUIC_REVISION=cee2e5d079ca2b55e421d81df1ad131c1bfeecc6

RUN mkdir -p build && \
    cd build && \
    git clone https://github.com/nodejs/quic.git && \
    cd quic && \
    git reset --hard $NODE_QUIC_REVISION && \
    # Build Node.js with QUIC
    ./configure --experimental-quic && \
    CC='ccache gcc' CXX='ccache g++' make -j2 && \
    # Install
    make install PREFIX=/usr/local && \
    rm -rf /build

CMD [ "node" ]
