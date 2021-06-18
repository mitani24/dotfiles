#!/bin/bash

# install HomeBrew (https://brew.sh/index_ja)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages
brew bundle --global
