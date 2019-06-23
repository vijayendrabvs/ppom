#!/usr/bin/env bash

cd $GOPATH/src/github.com/fabric-samples/chaincode-docker-devmode/
docker-compose -f docker-compose-simple.yaml up
