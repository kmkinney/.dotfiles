#!/bin/bash

#-----------------#
# alacritty setup #
#-----------------#

CONFIG_DIR=$HOME/.config/alacritty/
mkdir -p $CONFIG_DIR

if [[ -f $CONFIG_DIR/alacritty.yml ]]; then
	echo "Backing Up alacritty.yml"
	mv $CONFIG_DIR/alacritty.yml $CONFIG_DIR/alacritty.yml.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking alacritty.yml"
ln -s $DOTFILES_DIR/alacritty/alacritty.yml $CONFIG_DIR/alacritty.yml
