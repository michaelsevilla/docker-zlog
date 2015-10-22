FROM ceph/base:centos

MAINTAINER Michael Sevilla <mikesevilla3@gmail.com>

# install deps
RUN yum install -y \
        boost-devel \
        protobuf-compiler \
        protobuf-devel \
        librados2 \
        ceph-devel

# override tutum's run.sh with our own
ADD run.sh /run.sh
