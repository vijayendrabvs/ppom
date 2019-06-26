#!/usr/bin/env bash
set -x

source ~/.profile

mkdir -p $GOPATH/src/github.com/fabric-samples/chaincode/myechoasset
cp -f ./myechoasset.go $GOPATH/src/github.com/fabric-samples/chaincode/myechoasset/

docker exec -it chaincode bash -c "cd /opt/gopath/src/chaincode/myechoasset && go build -gcflags '-l'"
read x

cd $GOPATH/src/github.com/fabric-samples/chaincode/myechoasset && CORE_PEER_ADDRESS=localhost:7052 CORE_CHAINCODE_ID_NAME=myechoasset:0 ./myechoasset &

read x
docker exec -it cli bash -c "peer chaincode install -p chaincodedev/chaincode/myechoasset -n myechoasset -v 0"

read x
docker exec -it cli bash -c "peer chaincode instantiate -n myechoasset -v 0 -c '{\"Args\":[]}' -C myc"
read x
