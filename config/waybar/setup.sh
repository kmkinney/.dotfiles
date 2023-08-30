#!/bin/bash

#--------------#
# waybar setup #
#--------------#

CONFIG_DIR=$HOME/.config/waybar/
mkdir -p $CONFIG_DIR

if [[ -f $CONFIG_DIR/config ]]; then
	echo "Backing Up waybar config"
	mv $CONFIG_DIR/config $CONFIG_DIR/config.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking waybar.css"
ln -s $DOTFILES_DIR/waybar/waybar.css $CONFIG_DIR/style.css

echo "Linking waybar.json"
ln -s $DOTFILES_DIR/waybar/waybar.jsonc $CONFIG_DIR/config
