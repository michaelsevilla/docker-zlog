Wraps a given zlog codebase in a container. It pulls the code and puts it into /ceph in the container (if it isn't already there). Then it builds the the zlog OSD libraries against the ceph source tree. The user should then attach the directory to the ceph/demo container, run it, and copy the zlog executables to the OSD interfaces directory. 

1. pulls the ceph source and checks out the zlog branch

2. builds the zlog OSD libraries against that source tree

3. pulls the zlog client source 

4. builds the zlog 

===================================================
Quickstart
===================================================

Build the container: 

    docker build -t zlog .

Build zlog: 

    docker run \
        -v /tmp/docker/zlog:/ceph \
        michaelsevilla/zlogdev-build

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
