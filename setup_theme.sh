#!/bin/env bash

source common.sh

if ! [ -x /usr/bin/git ]
  then echo -e "${RED}Git is not installed. Make sure you've executed the setup.sh script first."
fi

# Installing a GTK theme



# Tweaks config, use: [gnome-weaks -v] to toggle verbose/debug mode

gsettings set org.gnome.desktop.background picture-uri file:///./Theme/Wallpaper.jpg

gsettings set org.gnome.mutter center-new-windows "true"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'WhiteSur-Dark'"

