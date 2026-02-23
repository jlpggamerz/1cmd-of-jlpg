#!/bin/bash
clear
echo "========================================="
echo "     JLPG PTERODACTYL AUTO INSTALLER     "
echo "========================================="
echo "        Created by JLPG                  "
echo "========================================="

if [ "$EUID" -ne 0 ]; then
  echo "Run as root!"
  exit
fi

apt update && apt upgrade -y
apt install curl -y
curl -sSL https://get.docker.com/ | CHANNEL=stable bash
bash <(curl -s https://pterodactyl-installer.se)

echo "JLPG Installation Completed!"
