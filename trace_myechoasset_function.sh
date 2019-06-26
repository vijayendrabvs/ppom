#!/usr/bin/env bash

set -x

func=$1
source ~/.profile
regex=/home/ubuntu/go/src/github.com/fabric-samples/chaincode/myechoasset/myechoasset:main*MyEchoAsset*${func}
cd $GOPATH/src/github.com/bcc/tools && sudo ./funclatency.py $regex >> /tmp/output 2>&1
