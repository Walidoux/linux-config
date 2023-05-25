#!/bin/env bash

source common.sh

if [ "$EUID" -ne 0 ]; then
  echo -e $MESSAGE_NO_PERMISSION
  exit 1
fi

# Fallback PPA
apt-get install software-properties-common

add-apt-repository --yes main
add-apt-repository --yes universe
add-apt-repository --yes restricted
add-apt-repository --yes multiverse
add-apt-repository --yes ppa:git-core/ppa

apt-get update --yes
apt-get upgrade --yes
apt-get install --yes \
  git \
  curl \
  wget \
  cloc \
  ffmpeg \
  plank \
  gnome-tweaks \
  gnome-shell-extensions-manager \
  minecraft-launcher

snap install \
  figma-linux \
  notion-snap \
  spotify
  
# Replace firefox snap because of gnome issues with deb installation
# Make sure to install Dashlane manually: https://www.dashlane.com/extension/standalone
snap remove firefox
apt-get install firefox --yes

# Removing other useless tools
apt-get purge --yes \
  thunderbird \
  gedit

apt-get autoremove --yes
