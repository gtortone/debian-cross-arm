#!/bin/bash

dpkg --add-architecture armhf 
dpkg --add-architecture arm64
apt-get update

apt-get install -y zlib1g:armhf zlib1g-dev:armhf \
   libboost-date-time-dev:armhf \
   libboost-serialization-dev:armhf \
   libboost-iostreams-dev:armhf \
   libzmq5:armhf \
   libczmq-dev:armhf \
   libzmq3-dev:armhf \
   libzstd1:armhf \
   libzstd-dev:armhf

apt-get install -y zlib1g:arm64 zlib1g-dev:arm64 \
   libboost-date-time-dev:arm64 \
   libboost-serialization-dev:arm64 \
   libboost-iostreams-dev:arm64 \
   libzmq5:arm64 \
   libczmq-dev:arm64 \
   libzmq3-dev:arm64 \
   libzstd1:arm64 \
   libzstd-dev:arm64

mkdir /opt/arm /opt/noarch

# NOARCH

cd /opt/noarch
git clone https://github.com/zeromq/cppzmq.git
cd cppzmq
cp zmq.hpp /usr/include
cp zmq_addon.hpp /usr/include


cd /opt/arm
git clone https://github.com/gtortone/ToolDAQFramework.git

# ARMHF
cd /opt/arm/ToolDAQFramework
cmake -B build-armhf -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain-arm-linux-gnueabihf.cmake
make -j -C build-armhf
cp build-armhf/include/*.h /usr/include
cp build-armhf/lib/*.so /usr/lib/arm-linux-gnueabihf
cp build-armhf/lib/*.a /usr/lib/arm-linux-gnueabihf

# ARM64
cd /opt/arm/ToolDAQFramework
cmake -B build-arm64 -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain-aarch64-linux-gnu.cmake
make -j -C build-arm64
cp build-arm64/lib/*.so /usr/lib/aarch64-linux-gnu/
cp build-arm64/lib/*.a /usr/lib/aarch64-linux-gnu/
