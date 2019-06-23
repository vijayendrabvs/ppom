#!/usr/bin/env bash

./install_pre_reqs.sh
./setup_bcc.sh

echo " Setting up golang env, and cloning fabric samples repo"
./setup_golang_fabric.sh

echo "In a separate window, please run ./setup_fabric_env.sh. After it is up, press ENTER to continue with setup"
read x

./setup_chaincode.sh

echo "In a separate window, please run ./make_chaincode_alive.sh. After it is up, press ENTER to continue"
read x

echo "Capturing latencies in ./latencies"
mkdir -p ./latencies
epoch=`date +'%s'`
sudo cat /sys/kernel/debug/tracing/trace_pipe > ./latencies/captured_latencies_${epoch} &

echo "In a separate window, please run sudo ./trace_myechoasset_function.sh Invoke, press ENTER to continue"
read x

echo "Running stress tool"
sudo stress --cpu 4 --io 3 --vm 2 --vm-bytes 256M --timeout 2000s &

echo "Now, invoking chain code 500 times"
./run_chaincode.sh 500

echo "Runs completed, results in ./latencies/captured_latencies_${epoch}"


