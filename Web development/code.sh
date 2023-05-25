#!/bin/bash

RED='\033[1;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]
  then echo -e "$RED⛔ Hey Walid, where's your sudo friend."
  exit 1
fi

# Visual Studio Code 
echo -e "${ORANGE}Installing Visual Studio code...$NC\n"
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository --yes "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update --yes
apt install code

# NVM (Node) installation
echo -e "\n${ORANGE}Installing NVM (Node)$NC\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc

echo -e "\n${GREEN}Now make sure you install node through nvm and also yarn through npm.\n"
