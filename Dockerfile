FROM ubuntu:xenial

RUN apt-get update -qy && apt-get -qy install \
 multistrap fakeroot fakechroot qemu-user-static binfmt-support

WORKDIR /root/

COPY README.md  .
COPY build   build
COPY busybox-klibc busybox-klibc
COPY deploy deploy
COPY firmware firmware
COPY kernel     kernel
COPY raspbian raspbian

RUN ln -s ./rpi-ramdisk/raspbian/lib/ld-linux-armhf.so.3 /lib

CMD ["./build"]
