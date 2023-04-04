#!/bin/bash

DOTFILES_DIR="$(git rev-parse --show-toplevel)"
NVIM_CONFIG_DIR=~/.config/nvim

if [[ -d ~/.config/nvim ]]; then
	echo "NVIM config already exists, aborting..."
	exit 1
fi

ln -s $DOTFILES_DIR/nvim $NVIM_CONFIG_DIR
