#!/bin/env bash

ORANGE='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m'

MESSAGE_NO_PERMISSION="$RED⛔ Insufficient permission. What the hell you think you're doing ?$NC"

GIT_USERNAME="Walidoux"
GIT_EMAIL="ma.walidkorchi@icloud.com"

# param1: start color
# param2: message
debug () {
    echo -e "\n${1}${2}$NC\n"
}
