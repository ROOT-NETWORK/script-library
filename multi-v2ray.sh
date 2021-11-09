#!/bin/bash
# Autoscript By JOHN SAKA
clear

echo " ===================================== "
echo "|       Autoscript By JOHN SAKA       |"
echo "|             Bug Report:             |"
echo "|      rootnetwork.vpn@gmail.com      |"
echo "|        Whatsapp: 60144003600        |"
echo " ===================================== "

echo "Autoscript start in 5 seconds"
sleep 5

# System update
echo "Check for system update"
apt update && apt list --upgradable && apt upgrade -y
echo "System updated"
sleep 2
clear

# Reconfigure localtime
echo "Set localtime to Asia/Kuala_Lumpur"
ln -sf /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime
timedatectl
sleep 3

# BBR+FQ
echo "Install BBR module and FQ acceleration"
echo -e "net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sleep 3

# DDoS Deflate
echo "Install DDoS Deflate module"
apt install -y dnsutils tcpdump dsniff grepcidr unzip && wget -qO ddos.zip "https://raw.githubusercontent.com/iriszz-official/autoscript/main/FILES/ddos-deflate.zip" && unzip ddos.zip && cd ddos-deflate && chmod +x install.sh && ./install.sh && cd && rm -rf ddos.zip ddos-deflate
echo "DDoS Deflate Installed"
sleep 3

# Speedtest CLI
echo "Install Ookla speedtest"
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
sudo apt-get install speedtest
echo "Check system network speed"
speedtest -A
sleep 5
clear

# Multi-V2Ray
echo "Install Multi-V2Ray script"
source <(curl -sL https://multi.netlify.app/v2ray.sh)
echo "Script installation done"
echo "System will reboot in 5 seconds"
sleep 5
clear