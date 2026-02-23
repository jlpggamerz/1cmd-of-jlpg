#!/bin/bash

# Colors
RED='\033[1;31m'
NC='\033[0m' # No Color

clear
echo -e "${RED}=====================================${NC}"
echo -e "${RED}        JLPG VPS AUTO INSTALLER     ${NC}"
echo -e "${RED}=====================================${NC}"
echo -e "${RED}1) Install Panel${NC}"
echo -e "${RED}2) Install Wings${NC}"
echo -e "${RED}3) Install Panel + Wings${NC}"
echo -e "${RED}4) Uninstall Pterodactyl${NC}"
echo -e "${RED}5) Update Script${NC}"
echo -e "${RED}6) Exit${NC}"
echo -e "${RED}=====================================${NC}"

read -p "Select an option [1-6]: " option

case $option in

1)
  echo -e "${RED}Installing Panel...${NC}"
  bash <(curl -s https://pterodactyl-installer.se)
  ;;

2)
  echo -e "${RED}Installing Wings...${NC}"
  bash <(curl -s https://pterodactyl-installer.se)
  ;;

3)
  echo -e "${RED}Installing Panel + Wings...${NC}"
  bash <(curl -s https://pterodactyl-installer.se)
  ;;

4)
  echo -e "${RED}Uninstalling Pterodactyl...${NC}"
  bash <(curl -s https://pterodactyl-installer.se)
  ;;

5)
  echo -e "${RED}Updating JLPG Installer...${NC}"
  bash <(curl -s https://raw.githubusercontent.com/jlpggamerz/Vps-cmd-code-/main/install.sh)
  ;;

6)
  echo -e "${RED}Exiting...${NC}"
  exit
  ;;

*)
  echo -e "${RED}Invalid option!${NC}"
  ;;

esac
