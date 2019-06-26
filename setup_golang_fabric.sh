#!/usr/bin/env bash

mkdir -p ~/go/src/github.com
echo "export GOPATH=~/go" >> ~/.profile
source ~/.profile
cd $GOPATH/src/github.com
git clone https://github.com/hyperledger/fabric-samples.git
cd fabric-samples/
git remote add vijay https://github.com/vijayendrabvs/fabric-samples.git
git fetch vijay
git checkout release-1.4-with-port
