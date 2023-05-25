#!/bin/env bash

# Usage: sudo ./initialize-config.sh

if [[ "$(id --user)" -ne 0 ]]; then
  echo -e "\e[1;31m⛔ No permission. What the hell you think you're doing ?\e[0m"
  exit 1
fi

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# For tauri app desktop app development
apt install --yes libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev
