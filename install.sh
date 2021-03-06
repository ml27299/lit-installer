#!/bin/bash

LIT_REPO="https://github.com/ml27299/lit-cli.git"

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

eval "git clone $LIT_REPO ${HOME}/lit"
eval "sudo chown -R $(whoami) ${HOME}/lit"

OS=$(uname_os)

if [[ $(uname_os) = "windows" ]]; then 
	eval "cp ${HOME}/lit/lit.sh C:\bin\lit.sh"
	eval "cp ${HOME}/lit/lit.bat C:\bin\lit.bat"
	exit
fi

${HOME}/lit/lit.sh --update