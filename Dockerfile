FROM ubuntu:bionic
MAINTAINER HermesCK
RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible git mc nano wget curl

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts && \
    mkdir /root/ansible-bin && mkdir /root/ansible-work
    
COPY bin/* /root/ansible-bin/

VOLUME ["/etc/ansible", "/root/ansible-bin", "/root/ansible-work"]

WORKDIR /root/ansible-work
