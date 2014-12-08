#!/usr/bin/env bash

# Assume we start in user's home directory
cd ~/

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install brew (this also install Xcode command line tools)
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

# Grab dotfiles directory
git clone https://www.github.com/danielsuo/dotfiles.git

# Run main setup file
cd dotfiles
sh main.sh