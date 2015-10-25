#!/bin/bash

set -e

if [ -z "$GIT_URL"] ; then
  GIT_URL="https://github.com/noahdesu/ceph.git"
fi

# allow the user to provide their own zlog serc
if [ ! -d /ceph/.git ] ; then
  cd /
  # don't let the user define the commit
  git clone --recursive $GIT_URL
  cd /ceph
  git checkout -b cls_zlog remotes/origin/cls_zlog
fi

cd /ceph
git clean -fd
git submodule update --init --recursive
./autogen.sh
./configure
cd src

# build source code if /zlog folder exists; don't enable multithread because it builds quickly
exec make libcls_zlog.la
exec make libcls_zlog_client.la
