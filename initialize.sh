#!/bin/bash

cd `dirname $0`

# install HomeBrew (https://brew.sh/index_ja)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages
brew bundle --global

# install sounds
cp assets/sounds/* $HOME/Library/Sounds
