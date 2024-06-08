#!/bin/bash

#-----------#
# Git Setup #
#-----------#

if [[ -f $HOME/.gitconfig ]]; then
	echo "Backing Up Gitconfig"
	mv $HOME/.gitconfig $HOME/.gitconfig.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking .gitconfig"
ln -s $DOTFILES_DIR/git/.gitconfig $HOME/.gitconfig
