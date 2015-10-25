Wraps a given zlog codebase in a container. It pulls the code and puts it into /ceph in the container (if it isn't already there). Then it builds the code. The user should then attach the directory to the ceph/demo container, run it, and copy the zlog executables to the OSD interfaces directory.

===================================================
Quickstart
===================================================

Build the container: 

    docker build -t zlog .

Build zlog: 

    docker run \
        -v /tmp/docker/zlog:/ceph \
        zlogdev-build

Load the executables into the OSD interfaces:

    docker run -it \
        --name=ceph \
        -v /etc/ceph:/etc/ceph \
        -v /tmp/docker/zlog:/zlog \
        -e CEPH_NETWORK=127.0.0.1/24 \
        -e MON_IP=127.0.0.1 \
        --net=host \
        --privileged \
        ceph/demo
    docker exec ceph cp \
        /zlog/src/.libs/libcls_zlog.so* \
        /usr/lib/rados-classes/
    docker restart ceph
