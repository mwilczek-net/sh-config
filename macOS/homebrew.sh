#!/bin/zsh

brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# if just isntalled, brew is not available in current context. We need to start new one
zsh -c "brew install fortune"
zsh -c "brew install cowsay"
zsh -c "brew install toilet"
zsh -c "brew install dialog"
zsh -c "brew install tree"

# zsh -c "brew install python-gdbm@3.9"
zsh -c "brew install python-gdbm@3.13"
