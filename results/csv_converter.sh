#!/usr/bin/env bash
dire=$1

mkdir ./csv_$dire

cpus=`cat $dire/config_info | grep cpu | tr -d ' ' | cut -d':' -f2`
mem=`cat $dire/config_info | grep memory | tr -d ' ' | cut -d':' -f2`

stress_cpus=`cat $dire/stress_info | cut -d' ' -f4`
stress_io=`cat $dire/stress_info | cut -d' ' -f6`
stress_vm=`cat $dire/stress_info | cut -d' ' -f8`
stress_vm_bytes=`cat $dire/stress_info | cut -d' ' -f10`

echo "$cpus, $mem, $stress_cpus, $stress_io, $stress_vm, $stress_vm_bytes"

echo "timestamp,cpus,mem,stress_cpus,stress_io,stress_vm,stress_vm_bytes,latency" >> ./csv_$dire/latencies.csv
cat $dire/latencies | \
while read latency_line; do
    lat_line=`echo $latency_line | tr -s ' '`
    ts=`echo $lat_line | cut -d' ' -f4 | tr -d ':'`
    latency=`echo $lat_line | cut -d' ' -f6`
    echo "$ts,$cpus,$mem,$stress_cpus,$stress_io,$stress_vm,$stress_vm_bytes,$latency" >> ./csv_$dire/latencies.csv 
done
