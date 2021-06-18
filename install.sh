#!/bin/bash

DOT_DIR="$HOME/dotfiles"

has() {
  type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
  if has "git"; then
    git clone https://github.com/mitani24/dotfiles.git ${DOT_DIR}
  elif has "curl" || has "wget"; then
    TARBALL="https://github.com/mitani24/dotfiles/archive/main.tar.gz"
    if has "curl"; then
      curl -L ${TARBALL} -o main.tar.gz
    else
      wget ${TARBALL}
    fi
    tar -zxvf main.tar.gz
    rm -f main.tar.gz
    mv -f dotfiles-main "${DOT_DIR}"
  else
    echo "curl or wget or git required"
    exit 1
  fi
else
  echo "dotfiles already exists"
  exit 1
fi
