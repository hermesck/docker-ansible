FROM ubuntu:20.04
MAINTAINER HermesCK
# User configuration
ARG USER=ansibler
ARG UID=1000
ARG GID=1000
ARG PW=ansibler

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Prague /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y ansible git mc nano wget curl && \
    mkdir /root/bin && mkdir /root/work && \
    useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | chpasswd && \
    mkdir /home/ansibler/work
    
COPY bin/* /root/bin/

# Setup default user, when enter docker container
USER ${UID}:${GID}
WORKDIR /home/ansibler/work
