#!/bin/bash

RED='\033[1;31m'
NC='\033[0m'

clear
echo -e "${RED}=====================================${NC}"
echo -e "${RED}        JLPG CUSTOM INSTALLER       ${NC}"
echo -e "${RED}=====================================${NC}"
echo -e "${RED}1) Install Panel (Custom)${NC}"
echo -e "${RED}2) Install Wings (Docker)${NC}"
echo -e "${RED}3) Install Panel + Wings${NC}"
echo -e "${RED}4) Create Admin User${NC}"
echo -e "${RED}5) Update Installer${NC}"
echo -e "${RED}6) Exit${NC}"
echo -e "${RED}=====================================${NC}"

read -p "Select an option [1-6]: " option

case $option in

1)
  echo -e "${RED}Installing Panel...${NC}"
  apt update && apt upgrade -y
  apt install nginx mysql-server redis-server curl tar unzip git -y
  apt install php php-cli php-fpm php-mysql php-gd php-mbstring php-bcmath php-xml php-curl -y

  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer

  mkdir -p /var/www/pterodactyl
  cd /var/www/pterodactyl
  curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
  tar -xzvf panel.tar.gz
  chmod -R 755 storage/* bootstrap/cache/

  cp .env.example .env
  composer install --no-dev --optimize-autoloader
  php artisan key:generate

  echo -e "${RED}Panel Installed! Complete setup manually with artisan commands.${NC}"
  ;;

2)
  echo -e "${RED}Installing Wings...${NC}"
  curl -sSL https://get.docker.com/ | bash
  mkdir -p /etc/pterodactyl
  curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
  chmod +x /usr/local/bin/wings
  echo -e "${RED}Wings Installed! Configure from panel.${NC}"
  ;;

3)
  bash "$0" <<< "1"
  bash "$0" <<< "2"
  ;;

4)
  echo -e "${RED}Creating Admin User...${NC}"
  cd /var/www/pterodactyl
  php artisan p:user:make
  ;;

5)
  echo -e "${RED}Updating JLPG Installer...${NC}"
  bash <(curl -s https://raw.githubusercontent.com/jlpggamerz/1cmd-of-jlpg/main/install.sh)
  ;;

6)
  exit
  ;;

*)
  echo -e "${RED}Invalid Option!${NC}"
  ;;

esac
