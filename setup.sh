#!/bin/env bash

source common.sh

if [ "$EUID" -ne 0 ]
  then echo -e "$RED⛔ Hey Walid, where's your sudo friend."
  exit 1
fi

add-apt-repository --yes main
add-apt-repository --yes universe
add-apt-repository --yes restricted
add-apt-repository --yes multiverse
add-apt-repository --yes ppa:git-core/ppa

apt-get update --yes
apt-get upgrade --yes
apt-get install --yes \

  # Utilities
  git \
  curl \
  wget \
  cloc \
  ffmpeg \
  
  # Misc
  gnome-tweaks \
  gnome-shell-extensions-manager \
  
  # Applications
  filezilla \
  spotify-client \
  minecraft-launcher
  
#snap install figma-linux \
#  notion-snap
  
# Replace firefox snap because of gnome issues with deb installation
# Make sure to install Dashlane manually: https://www.dashlane.com/extension/standalone
snap remove firefox
apt-get install firefox --yes

# Removing other useless tools
apt-get purge --yes \
  thunderbird \
  gedit

apt-get autoremove --yes
