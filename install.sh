#!/bin/bash

LIT_REPO="https://github.com/ml27299/liaison-cmd-v2.git"
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

eval "git cl"