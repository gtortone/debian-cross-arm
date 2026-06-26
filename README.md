# debian-cross-armhf
Docker image based on Debian for ARMhf cross-compilation

## Features

This image offers a development environment for ARMhf with
C/C++ compilers (arm-linux-gnueabihf) and a pre-installed
ToolDAQFramework library in `/opt/armhf` based on:

https://github.com/gtortone/ToolDAQFramework

## Deploy container from ghcr.io

```
docker run --name debian-12-cross-armhf -e LANG=C.UTF-8 \
  -it ghcr.io/gtortone/debian-12-cross-armhf:main /bin/bash -l
```

## Create image

```
docker build --no-cache --build-arg DEBIAN_VERSION=12 --tag debian-12-cross-armhf .
```

Change DEBIAN_VERSION to test different Debian releases.
