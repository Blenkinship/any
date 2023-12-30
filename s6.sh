#!/bin/bash

case `uname -m` in aarch64|arm64) VER="arm64";; x86_64|amd64) VER="amd64";; *) VER="";; esac
[ -n "$VER" ] || exit 1

PORT=`echo "$1" |grep '[0-9]*' |head -n1`

rm -rf /usr/local/bin/socks5
rm -rf /etc/systemd/system/socks5.service

wget --no-check-certificate --header="Authorization: token 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" -qO "/usr/local/bin/socks5" "https://raw.githubusercontent.com/MoeClub/Private/master/socks5/socks5_${VER}"
chmod 777 /usr/local/bin/socks5
chown root:root /usr/local/bin/socks5

[ -f /etc/security/limits.conf ] && LIMIT='262144' && sed -i '/^\(\*\|root\)[[:space:]]*\(hard\|soft\)[[:space:]]*\(nofile\|memlock\)/d' /etc/security/limits.conf && echo -ne "*\thard\tmemlock\t${LIMIT}\n*\tsoft\tmemlock\t${LIMIT}\nroot\thard\tmemlock\t${LIMIT}\nroot\tsoft\tmemlock\t${LIMIT}\n*\thard\tnofile\t${LIMIT}\n*\tsoft\tnofile\t${LIMIT}\nroot\thard\tnofile\t${LIMIT}\nroot\tsoft\tnofile\t${LIMIT}\n\n" >>/etc/security/limits.conf
[ -f /etc/systemd/system.conf ] && sed -i 's/#\?DefaultLimitNOFILE=.*/DefaultLimitNOFILE=262144/' /etc/systemd/system.conf

# sed -i '/socks5/d' /etc/crontab
# while [ -z "$(sed -n '$p' /etc/crontab)" ]; do sed -i '$d' /etc/crontab; done
# sed -i '$a\@reboot root nohup /usr/local/bin/socks5 -U Haibara -P arabiaH >/dev/null 2>&1 &\n\n' /etc/crontab

cat >/etc/systemd/system/socks5.service<<EOF
[Unit]
Description=socks5
After=local-fs.target network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/socks5 -U Haibara -P arabiaH -p ${PORT:-8080}
KillMode=process
KillSignal=SIGINT
TimeoutStopSec=1
Restart=always
RestartSec=1s

[Install]
WantedBy=multi-user.target

EOF

cat >/etc/systemd/system/socks5-np.service<<EOF
[Unit]
Description=socks5
After=local-fs.target network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/socks5 -p 9090
KillMode=process
KillSignal=SIGINT
TimeoutStopSec=1
Restart=always
RestartSec=1s

[Install]
WantedBy=multi-user.target

EOF

systemctl disable socks5 2>/dev/null
systemctl daemon-reload
systemctl enable socks5
systemctl start socks5

systemctl enable socks5-np
systemctl start socks5-np

# reboot 2>/dev/null || sudo reboot
