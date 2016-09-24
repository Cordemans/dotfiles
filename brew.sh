#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install other useful binaries.
brew install ack
brew install git
brew install imagemagick --with-webp
brew install lynx
brew install tree
brew install tmux

brew cask install thunderbird
brew cask install firefox
brew cask install google-chrome
brew cask install opera
brew cask install sequel-pro
brew cask install iterm2
brew cask install hammerspoon
brew cask install virtualbox
brew cask install chromium
brew cask install libreoffice
brew cask install macdown

brew cask install transmission
brew cask install flux
brew cask install spotify


# Remove outdated versions from the cellar.
brew cleanup
