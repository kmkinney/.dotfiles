#!/bin/bash

if [[ -f ~/.bashrc ]]; then
	echo "Making backup"
	mv ~/.bashrc ~/.bashrc.bak
fi

if [[ -f ~/.bash_aliases ]]; then
	echo "Making backup"
	mv ~/.bash_aliases ~/.bash_aliases.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking .bashrc"
ln -s $DOTFILES_DIR/bash/bashrc.sh ~/.bashrc
ln -s $DOTFILES_DIR/bash/bash_aliases.sh ~/.bash_aliases
