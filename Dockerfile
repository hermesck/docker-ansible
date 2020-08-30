FROM ubuntu:20.04
MAINTAINER HermesCK

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Prague /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y ansible git mc nano wget curl && \
    mkdir /root/bin && mkdir /root/work
    
COPY bin/* /root/bin/

WORKDIR /root/work
