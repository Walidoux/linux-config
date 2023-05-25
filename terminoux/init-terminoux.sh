#!/bin/bash

ORANGE='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[1;31m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]
  then echo -e "$RED⛔ Hey Walid, where's your sudo friend."
  exit 1
fi

echo -e "${ORANGE}Installing FiraCode font...$NC\n"
apt install fonts-firacode --yes

## Shipping all keys on schema type: [gsettings list-recursively org.gnome.desktop.interface]
gsettings set org.gnome.desktop.interface monospace-font-name "FiraCode Nerd Font 13"

echo -e "\n${ORANGE}Implementing syntax highlighting for zsh...$NC\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/walidoux/.config/zsh-syntax-highlighting

echo -e "\n${ORANGE}Implementing autosuggestions for zsh...$NC\n"
git clone https://github.com/zsh-users/zsh-autosuggestions /home/walidoux/.config/zsh-autosuggestions

echo -e "\n${ORANGE}Installing ruby for colorls zsh's plugin...$NC\n"
apt-get install ruby-full --yes
gem install colorls

echo -e "\n${ORANGE}Overwriting default config.$NC\n"
cp resources/.zshrc /home/walidoux

cp resources/cat_ascii /home/walidoux/.config/neofetch
cp -r resources/colorls /home/walidoux/.config

chsh -s /bin/zsh # Sets zsh as the default shell
cp resources/Terminoux.png /usr/share/icons
cp resources/org.gnome.Terminal.desktop /usr/share/applications

echo -e "\n${GREEN}Make sure to install spaceship-prompt globally for zsh manually:\n"
echo -e "git clone https://github.com/spaceship-prompt/spaceship-prompt.git '$ZSH_CUSTOM/themes/spaceship-prompt' --depth=1"
echo -e "ln -s '$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme' '$ZSH_CUSTOM/themes/spaceship.zsh-theme'$NC\n"

echo -e "\n${ORANGE}Installing oh-my-zsh...$NC\n"
apt install zsh --yes
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
