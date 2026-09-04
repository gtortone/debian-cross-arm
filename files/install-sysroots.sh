#!/bin/bash

echo "==========================="
echo Linux Debian $DEBIAN_VERSION
echo "==========================="

# configure GIT to use HTTP/1.1
git config --global http.version HTTP/1.1

apt-get update

PKGS=(
    "zlib1g"
    "zlib1g-dev"
    "libboost-date-time-dev"
    "libboost-iostreams-dev"
    "libboost-serialization-dev"
    "libzmq5"
    "libczmq-dev"
    "libzmq3-dev"
    "libzstd1"
    "cppzmq-dev"
    "python3-pybind11"
    "pybind11-dev"
    "nlohmann-json3-dev"
    "python3-pip"
)

case "$DEBIAN_VERSION" in
   12)
      DEBIAN_NAME=bookworm
      #PKGS+=("libboost-date-time1.74.0")
      #PKGS+=("libboost-iostreams1.74.0")
      #PKGS+=("libboost-serialization1.74.0")
      PKGS+=("libpython3.11")
      PKGS+=("libpython3.11-dev")
      PKGS+=("libcurlpp0")
      PKGS+=("libcurlpp-dev")
      ;;
   13)
      DEBIAN_NAME=trixie
      #PKGS+=("libboost-date-time1.83.0")
      #PKGS+=("libboost-iostreams1.83.0")
      #PKGS+=("libboost-serialization1.83.0")
      PKGS+=("libpython3.13")
      PKGS+=("libpython3.13-dev")
      PKGS+=("libcurlpp0t64")
      PKGS+=("libcurlpp-dev")
      ;;
   *)
      ;;
esac

SYSROOT_PKGS=$(IFS=,; echo "${PKGS[*]}")
HOST_PKGS="${PKGS[*]}"

# host

apt-get install -y "${PKGS[@]}"

# armhf sysroot

debootstrap --variant=minbase \
   --include=$SYSROOT_PKGS \
   --arch=armhf \
   --foreign $DEBIAN_NAME \
   /opt/sysroot/debian-armhf \
   http://deb.debian.org/debian

chroot /opt/sysroot/debian-armhf \
    /debootstrap/debootstrap \
    --second-stage

# arm64 sysroot

debootstrap --variant=minbase \
   --include=$SYSROOT_PKGS \
   --arch=arm64 \
   --foreign $DEBIAN_NAME \
   /opt/sysroot/debian-arm64 \
   http://deb.debian.org/debian

chroot /opt/sysroot/debian-arm64 \
    /debootstrap/debootstrap \
    --second-stage

# mkdir /opt/noarch

# NOARCH

#cd /opt/noarch
#git clone https://github.com/zeromq/cppzmq.git
#cd cppzmq
#cp zmq.hpp /usr/include
#cp zmq_addon.hpp /usr/include

