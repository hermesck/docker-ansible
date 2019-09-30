FROM ubuntu:bionic
MAINTAINER HermesCK
RUN apt-add-repository ppa:ansible/ansible && apt update && apt install -y ansible git
