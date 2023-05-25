#!/bin/env bash

source ../common.sh

if [[ "$(id --user)" -ne 0 ]]
  then echo -e $MESSAGE_NO_PERMISSION
  exit 1
fi

debug $ORANGE "🦀 Installing rust-lang..."

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# For Tauri development
apt install --yes libwebkit2gtk-4.0-dev \
    build-essential \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev
