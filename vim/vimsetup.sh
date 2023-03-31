#!/bin/bash

#-----------#
# Vim Setup #
#-----------#

if [[ -f $HOME/.vimrc ]]; then
	echo "Backing Up vimrc"
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)"

echo "Linking .vimrc"
ln -s $DOTFILES_DIR/vim/basics.vim $HOME/.vimrc
