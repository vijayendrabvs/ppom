#!/usr/bin/env bash

source ~/.profile
mkdir -p $GOPATH/src/github.com

#cd $GOPATH/src/github.com && git clone https://github.com/iovisor/bcc.git
cd $GOPATH/src/github.com && git clone -b print-func-latency --single-branch https://github.com/vijayendrabvs/bcc.git 

sudo apt-get install -y bpfcc-tools linux-headers-$(uname -r)

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/iovisor.list
sudo apt-get update
sudo apt-get install -y bcc-tools libbcc-examples linux-headers-$(uname -r)


