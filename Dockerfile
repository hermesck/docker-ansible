FROM ubuntu:bionic
MAINTAINER HermesCK
RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible git

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
