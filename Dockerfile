FROM ubuntu:xenial

RUN apt-get update -qy && apt-get -qy install \
 multistrap fakeroot fakechroot qemu-user-static binfmt-support

WORKDIR /root/

COPY README.md  .
COPY build   .
COPY busybox-klibc .
COPY deploy .
COPY firmware .
COPY kernel     .
COPY raspbian .

RUN ln -s ./rpi-ramdisk/raspbian/lib/ld-linux-armhf.so.3 /lib

CMD ["./build"]
