#!/bin/bash

source ../common.sh

if [ "$EUID" -ne 0 ]; then
  echo -e "$RED⛔ Hey Walid, where's your sudo friend."
  exit 1
fi

debug $ORANGE "💻 Installing VSCode IDE..."

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O code.deb
dpkg -i code.deb && rm -rf code.deb
chmod -R 777 "/usr/share/code"

debug $ORANGE "🟢 Installing NVM (Node)"

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
