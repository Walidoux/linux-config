#!/bin/env bash

source ../common.sh

if [[ "$(id --user)" -ne 0 ]]
  then echo -e $MESSAGE_NO_PERMISSION
  exit 1
fi

GIT_CONFIG_FILE="/home/$SUDO_USER/.gitconfig"

gpg --list-keys

echo "Generating GPG Key for commits signature..."
#gpg --default-new-key-algo rsa4096 --gen-key

GPG_KEY=$(gpg --list-secret-keys --keyid-format="long" | grep -o -P 'rsa.{0,4}/.{0,16}' | cut -d/ -f2)
echo $GPG_KEY

sleep 2

echo "Creating config file in:" $GIT_CONFIG_FILE
sleep 1

if [[ -f $GIT_CONFIG_FILE ]]; then
  echo "Git config file already exists."
  exit 1
else
  touch $GIT_CONFIG_FILE && chmod a+w $GIT_CONFIG_FILE
  echo "[user]
                name = $GIT_USERNAME
                email = $GIT_EMAIL
                signingKey = $GPG_KEY
	[commit]
                gpgSign = true
        [credential]
                helper = store
        [pull]
                rebase = true
        [fetch]
                prune = true" >> $GIT_CONFIG_FILE
fi

echo -e "\nExporting GPG Key for Github's usage...\n"
gpg --armor --export $GPG_KEY
