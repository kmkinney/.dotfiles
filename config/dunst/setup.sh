#!/bin/bash

#-------------#
# dunst setup #
#-------------#

CONFIG_DIR=$HOME/.config/dunst/
mkdir -p $CONFIG_DIR

if [[ -f $CONFIG_DIR/alacritty.yml ]]; then
	echo "Backing Up alacritty.yml"
	mv $CONFIG_DIR/alacritty.yml $CONFIG_DIR/alacritty.yml.bak
fi

if [[ -f $CONFIG_DIR/dunstrc ]]; then
	echo "Backing Up dunstrc"
	mv $CONFIG_DIR/dunstrc $CONFIG_DIR/dunstrc.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking dunstrc"
ln -s $DOTFILES_DIR/dunst/dunstrc.cfg $CONFIG_DIR/dunstrc
