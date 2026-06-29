# debian-cross-arm
Docker image based on Debian for ARMhf/ARM64 cross-compilation

## Features

This image offers a development environment for ARMhf/ARM64 with
C/C++ compilers (arm-linux-gnueabihf, aarch64-linux-gnu) and a pre-installed
ToolDAQFramework library in `/usr/lib/arm-linux-gnueabihf` and
`/usr/lib/aarch64-linux-gnu` based on:

https://github.com/gtortone/ToolDAQFramework

## Deploy container from ghcr.io

```
docker run --name debian-12-cross-arm -e LANG=C.UTF-8 \
  -it ghcr.io/gtortone/debian-12-cross-arm:main /bin/bash -l
```

## Create image

```
docker build --no-cache --build-arg DEBIAN_VERSION=12 --tag debian-12-cross-arm .
```

Change DEBIAN_VERSION to test different Debian releases.
