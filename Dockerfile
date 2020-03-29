# (base: https://github.com/nodejs/node/blob/1ae0511b942c01c6e0adff98643d350a395bf101/.travis.yml)

FROM ubuntu:18.04

LABEL maintainer="Ryo Ota <nwtgck@nwtgck.org"

# ENV CC='ccache gcc-4.9'
# ENV CXX='ccache g++-4.9'
# ENV JOBS=2

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt update && \
    apt install -y \
      g++ \
      python \
      ccache \
      build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV NODE_QUIC_REVISION=cee2e5d079ca2b55e421d81df1ad131c1bfeecc6

# Clone Node.js with QUIC
RUN apt update && apt install -y git && \
    mkdir -p build && \
    cd build && \
    git clone https://github.com/nodejs/quic.git && \
    cd quic && \
    git reset --hard $NODE_QUIC_REVISION && \
    apt remove -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# TODO: Move top
RUN apt update && apt install -y python3-distutils && apt-get clean && rm -rf /var/lib/apt/lists/*

# Build Node.js with QUIC
RUN cd /build/quic && \
    ./configure && \
    CC='ccache gcc' CXX='ccache g++' make -j2
RUN make install

CMD [ "node" ]
