#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

alias resolve-yarn-lock='$SCRIPT_DIR/resolve-yarn-lock.sh'
alias yadd='$SCRIPT_DIR/package-management/add.sh'
alias yremove='$SCRIPT_DIR/package-management/remove.sh'
