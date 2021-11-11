#!/bin/bash
# Bash SSH Menu
clear

echo "========================================="
echo "   V2RAY•VMESS•XRAY•VLESS•TLS•XTLS•CDN   "
echo "         Autoscript By JOHN SAKA         "
echo "========================================="
sleep 3

# Check for system update
echo "Upgrade package to latest update"
apt autoclean -y && apt autoremove -y
apt update && apt list --upgradable && apt upgrade -y
echo "All package are up to date"
sleep 3
clear

# Set Timezone
echo "Set to local time Asia/Kuala_Lumpur"
ln -sf /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
clear
echo "Date/time:"
timedatectl
sleep 3
clear

# Install TCP BBR-FQ
echo "Install BBR-FQ module"
echo -e "net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
syscrl -p
echo "Module and acceleration installed"
sleep 3
clear

# Install speedtest cli
echo "Install speedtest cli"
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
sudo apt-get install speedtest
echo "Run speedtest -A to check system network"
sleep 3
clear

# V2Ray or XRay option
PS3='Please enter your option: '
options=("v2ray" "xray")
select opt in "${options[@]}"
do
    case $opt in
        "v2ray")
            echo "Install V2Ray"
            source <(curl -sL https://multi.netlify.app/v2ray.sh)
            v2ray
            break
            ;;
        "xray")
            echo "Install XRay"
            source <(curl -sL https://multi.netlify.app/v2ray.sh)
            xray
            break
            ;;
        *) echo invalid option;;
    esac
done