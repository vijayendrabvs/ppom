#!/usr/bin/env bash

cd $GOPATH/src/github.com/fabric-samples/chaincode/myechoasset/
CORE_PEER_ADDRESS=localhost:7052 CORE_CHAINCODE_ID_NAME=myechoasset:0 ./myechoasset
