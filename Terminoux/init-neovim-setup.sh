#!/bin/bash

ORANGE='\033[0;33m'
RED='\033[1;31m'
NC='\033[0m'

CONFIG_PATH=$HOME/.config/nvim
COLOR_THEME_PATH=$CONFIG_PATH/colors

if [[ "$(id --user)" -ne 0 ]]; then
  echo -e "${RED}⛔ Insufficient permission. You know what to do :thumbsup:"
  exit 1
fi

echo -e "\n${ORANGE}📥 Updating dependencies at latest version...${NC}\n"

apt-get update --yes
apt-get upgrade --yes

echo -e "\n${ORANGE}📦 Cloning nvim package from Github. Unpacking...${NC}\n"

TEMP_DEB="$(mktemp)"
wget -O $TEMP_DEB 'https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb' && dpkg -i $TEMP_DEB

echo -e "\n${ORANGE}📁 Downloading vim-plug: (Plugin manager)${NC}\n"

sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

### echo -e "\n${ORANGE}📁 Downloading vim-plug: (Plugin manager)${NC}\n"

mkdir $CONFIG_PATH
mkdir $COLOR_THEME_PATH
cp resources/NeoSolarized.vim $COLOR_THEME_PATH

