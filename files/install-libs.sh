#!/bin/bash

# configure GIT to use HTTP/1.1
git config --global http.version HTTP/1.1

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
   libzstd-dev:armhf \
   libpython3.11:armhf \
   libpython3.11-dev:armhf \
   libcurlpp0:armhf \
   libcurlpp-dev:armhf

apt-get install -y zlib1g:arm64 zlib1g-dev:arm64 \
   libboost-date-time-dev:arm64 \
   libboost-serialization-dev:arm64 \
   libboost-iostreams-dev:arm64 \
   libzmq5:arm64 \
   libczmq-dev:arm64 \
   libzmq3-dev:arm64 \
   libzstd1:arm64 \
   libzstd-dev:arm64 \
   libpython3.11:arm64 \
   libpython3.11-dev:arm64 \
   libcurlpp0:arm64 \
   libcurlpp-dev:arm64

apt-get install -y zlib1g zlib1g-dev \
   libboost-date-time-dev \
   libboost-serialization-dev \
   libboost-iostreams-dev \
   libzmq5 \
   libczmq-dev \
   libzmq3-dev \
   libzstd1 \
   libpython3.11 \
   libpython3.11-dev \
   libcurlpp0 \
   libcurlpp-dev

mkdir /opt/noarch

# NOARCH

cd /opt/noarch
git clone https://github.com/zeromq/cppzmq.git
cd cppzmq
cp zmq.hpp /usr/include
cp zmq_addon.hpp /usr/include

