FROM ceph/base:centos

MAINTAINER Michael Sevilla <mikesevilla3@gmail.com>

# install deps
RUN yum install -y \
        wget \
        git \
        boost-devel \
        protobuf-compiler \
        protobuf-devel \
        librados2 \
        libtoolize \
        ceph-devel && \
    wget https://raw.githubusercontent.com/noahdesu/ceph/master/install-deps.sh && \
    wget https://raw.githubusercontent.com/noahdesu/ceph/master/ceph.spec.in && \
    chmod 755 install-deps.sh && \
    ./install-deps.sh

# kickoff the build process when the build starts
ADD build /
RUN chmod 755 /build
ENTRYPOINT ["/build"]
