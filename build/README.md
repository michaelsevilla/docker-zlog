Wraps a given zlog codebase in a container.

===================================================
Quickstart
===================================================

docker build -t zlog .
docker run \
    -v /tmp/docker/zlog:/ceph \
    -v /tmp/docker/ceph:/running-ceph \
    zlog

docker run -it \
    --name=cephtest \
    -v /etc/ceph:/etc/ceph \
    -e CEPH_NETWORK=127.0.0.1/24 \
    -e MON_IP=127.0.0.1 \
    --net=host \
    --privileged \
    --entrypoint=/bin/bash \
    ceph/demo

