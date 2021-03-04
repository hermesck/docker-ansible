FROM ubuntu:20.04
MAINTAINER HermesCK

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Prague /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install -y ansible git mc nano wget curl sshpass && \
    mkdir /root/bin && mkdir /root/work

COPY bin/* /root/bin/

# Custom colored prompt - used ENV to avoid escaping in RUN command 
ENV PS1A="\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\]\[\e[37m\]:\[\e[m\]\[\e[34m\]\w\[\e[m\] \[\e[33m\]\\$\[\e[m\] "
RUN echo 'PS1=$PS1A' >> ~/.bashrc

WORKDIR /root/work
