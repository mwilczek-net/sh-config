#!/bin/zsh

brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fortune
brew install cowsay
brew install toilet
brew install dialog
brew install tree

# brew install python-gdbm@3.9
brew install python-gdbm@3.11
