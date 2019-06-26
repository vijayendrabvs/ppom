#!/usr/bin/env bash

echo "Installing docker"
sudo apt install -y docker.io

echo "Adding id to docker group"
sudo usermod -aG docker `id -n`

echo "Installing git"
sudo apt install -y git

echo "Installing golang"
sudo apt install -y golang-go

echo "Installing docker-compose"
sudo apt install -y docker-compose

echo "Setting up GOPATH"
echo "export GOPATH=~/go/src/github.com" >> ~/.profile
source ~/.profile
