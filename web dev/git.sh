#!/bin/bash

source ../common.sh

if [ "$EUID" -ne 0 ]
  then echo -e $MESSAGE_NO_PERMISSION
  exit 1
fi

# if you want to remove a GPG Key: [! sudo !] gpg --delete-secret-keys <key>

echo -e "\n${ORANGE}Generating GPG Key for commits signature....$NC\n"
gpg --default-new-key-algo rsa4096 --gen-key

GPG_KEY=$(gpg --list-secret-keys --keyid-format="long" | grep -o -P 'rsa.{0,4}/.{0,16}' | cut -d/ -f2)

echo -e "\n${ORANGE}Overwriting default config.$NC"
cp resources/.gitconfig "$HOME/walidoux"

echo -e "\n${GREEN}Exporting GPG Key for Github's usage:$NC"
gpg --armor --export $GPG_KEY

echo -e "\n${GREEN}Now make sure you change your gpg key in the [.gitconfig] file.$NC"
Your key: $GPG_KEY
gpg --list-secret-keys --keyid-format LONG
