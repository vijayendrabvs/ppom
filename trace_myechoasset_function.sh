#!/usr/bin/env bash

set -x

func=$1

regex=/home/ubuntu/go/src/github.com/fabric-samples/chaincode/myechoasset/myechoasset:mainMyEchoAsset${func}

sudo ./funclatency.py $regex >> /tmp/output 2>&1
