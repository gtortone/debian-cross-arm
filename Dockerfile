ARG DEBIAN_VERSION=12
FROM debian:${DEBIAN_VERSION}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    dialog \
    readline-common \
    dnsutils \
    apt-utils \
    curl \
    build-essential \
    automake \
    autogen \
    bash \
    build-essential \
    bc \
    bzip2 \
    ca-certificates \
    curl \
    file \
    git \
    gzip \
    make \
    ncurses-dev \
    pkg-config \
    libtool \
    python3 \
    rsync \
    sed \
    bison \
    flex \
    tar \
    vim \
    wget \
    runit \
    xz-utils \
    iputils-ping \
    cmake \
    dialog \
    bash-completion \
    neovim \
    binutils-arm-linux-gnueabihf \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    libc6-armhf-cross \
    libc6-dev-armhf-cross \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    libc6-arm64-cross \
    libc6-dev-arm64-cross

RUN mkdir /opt/scripts

COPY files/bashrc /root/.bashrc
COPY files/install-tooldaq.sh /opt/scripts
COPY files/vimrc /root/.vimrc

RUN chmod +x /opt/scripts/install-tooldaq.sh && /opt/scripts/install-tooldaq.sh
