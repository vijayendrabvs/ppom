#!/usr/bin/env bash

source ~/.profile
cd $GOPATH/src/github.com/fabric-samples/chaincode-docker-devmode/
sudo docker-compose -f docker-compose-simple.yaml up
