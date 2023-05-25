#!/bin/env bash

source common.sh

debug $ORANGE "🎨 Applying a like-MacOS theme and adjusting config..."

current_dir=$(pwd)
cp "${current_dir}/config/Wallpaper.jpg" ~
wallpaper_path="/home/$USER/Wallpaper.jpg"

# Installing a GTK theme

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git linux-theme
cd linux-theme
./install.sh -t all -N glassy
sudo ./tweaks.sh -g -b $wallpaper_path -f monterey
cd .. && rm -rf linux-theme

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git linux-theme-icon
cd linux-theme-icon
./install.sh
cd .. && rm -rf linux-theme-icon

if ! [ -d ~/.icons ]
  then mkdir ~/.icons
fi

cp -r config/MacOS ~/.icons

# Tweaks config, use: [gnome-weaks -v] to toggle verbose/debug mode

gsettings set org.gnome.nautilus.preferences default-sort-order "type"

gsettings set org.gnome.mutter center-new-windows "true"

gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_path"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.interface icon-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-Dark"
dconf write /org/gnome/shell/extensions/user-theme/name "'WhiteSur-Dark'"

# Misc config (refactor)

sudo cp ./config/mpv.conf /etc/mpv/mpv.conf
