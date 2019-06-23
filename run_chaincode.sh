#!/usr/bin/env bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 <count>"
	exit 1
fi

c=$1

for count in `seq $c`; do
	docker exec -it cli bash -c "peer chaincode invoke -n myechoasset -c '{\"Args\":[\"echo\", \"arg1\"]}' -C myc"
done
