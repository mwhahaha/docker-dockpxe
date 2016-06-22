FROM debian:latest
MAINTAINER Alex Schultz <aschultz@next-development.com>

RUN apt-get update
# install packages
RUN apt-get install -y \
    python3 \
    dnsmasq \
    syslinux-common \
    pxelinux

VOLUME '/distros' '/configs'

RUN mkdir /pxe && \
    ln -s /distros /pxe/distros && \
    ln -s /configs/pxelinux.cfg /pxe/pxelinux.cfg && \
    ln -s /usr/lib/PXELINUX/pxelinux.0 /pxe/pxelinux.0 && \
    ln -s /usr/lib/syslinux /pxe/syslinux

EXPOSE '8888' '67'

COPY run.sh /run.sh

ENTRYPOINT '/run.sh'
