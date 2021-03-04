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
ENV PS1A="\[\033[38;5;12m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]:[\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;11m\]\\$\[$(tput sgr0)\]"
RUN echo 'PS1=$PS1A' >> ~/.bashrc

WORKDIR /root/work
