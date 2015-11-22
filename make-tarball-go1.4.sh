#!/bin/bash
set -ex

GOARM=${GOARM:-7}

# fetch Go 1.4.x source tarball
GO_VERSION=${GO_VERSION:-1.4.3}
rm -fr /usr/local/go
curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.src.tar.gz | tar xz -C /usr/local

# now compile Go 1.4.x and package it as a tarball
pushd /usr/local/go/src
#time ./all.bash 2>&1
time ./make.bash 2>&1
cd ../..
tar cfz go${GO_VERSION}.linux-armv${GOARM}.tar.gz go
popd
mv /usr/local/go${GO_VERSION}.linux-armv${GOARM}.tar.gz .

# cleanup
rm -fr /usr/local/go