#!/usr/bin/env bash

dotfiles="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --recursive

echo "Installing/Updating dotfiles..."

lnif() {
	if [ ! -e $2 ]; then
		ln -s $1 $2
	fi
}

echo "Setting up bash..."
lnif $dotfiles/.bashrc $HOME/.bashrc
lnif $dotfiles/.bash_profile $HOME/.bash_profile
lnif $dotfiles/.bash_prompt $HOME/.bash_prompt
lnif $dotfiles/.inputrc $HOME/.inputrc
lnif $dotfiles/.aliases $HOME/.aliases
lnif $dotfiles/.exports $HOME/.exports
lnif $dotfiles/.wgetrc $HOME/.wgetrc
lnif $dotfiles/.curlrc $HOME/.curlrc

echo "Setting up tmux..."
lnif $dotfiles/.tmux.conf $HOME/.tmux.conf

echo "Setting up vim..."
lnif $dotfiles/.vimrc $HOME/.vimrc
lnif $dotfiles/.vim $HOME/.vim

echo "Setting up Hammerspoon..."
lnif $dotfiles/.hammerspoon $HOME/.hammerspoon
