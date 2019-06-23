#!/usr/bin/env bash

source ~/.profile

mkdir $GOPATH/src/github.com/fabric-samples/chaincode/myechoasset
cp ./myechoasset.go $GOPATH/src/github.com/fabric-samples/chaincode/myechoasset/

docker exec -it chaincode bash -c "cd /opt/gopath/src/chaincode/myechoasset && go build -gcflags '-l'"

CORE_PEER_ADDRESS=localhost:7052 CORE_CHAINCODE_ID_NAME=myechoasset:0 ./myechoasset &

docker exec -it cli bash -c "peer chaincode install -p chaincodedev/chaincode/myechoasset -n myechoasset -v 0"

docker exec -it cli bash -c "peer chaincode instantiate -n myechoasset -v 0 -c '{\"Args\":[]}' -C myc"
