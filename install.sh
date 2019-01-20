#!/bin/bash

LIT_REPO="https://github.com/ml27299/lit-cli.git"
SSH_LIT_REPO="git@github.com:ml27299/lit-cli.git"

uname_os() {
  os=$(uname -s | tr '[:upper:]' '[:lower:]')
  case "$os" in
    msys_nt) os="windows" ;;
  esac
  echo "$os"
}

isGitAuthorized () {
	if [[ "$(git ls-remote $LIT_REPO > /dev/null)" != " " ]]; then echo "true";
	else echo "false"; fi
}

if [[ $(isGitAuthorized) = "false" ]]; then 
	echo "You cant clone $LIT_REPO, be sure you have correct access rights"
	exit
fi

eval "git clone $SSH_LIT_REPO ~/lit"
eval "cd ~/lit"
 
OS=$(uname_os)

if [[ $OS = "windows" ]]; then 
	eval "cp ~/lit/lit.sh C:\bin\lit.sh"
	eval "cp ~/lit/lit.bat C:\bin\lit.bat"
	exit
fi

eval "cp ~/lit/lit.sh /usr/local/bin/lit"
