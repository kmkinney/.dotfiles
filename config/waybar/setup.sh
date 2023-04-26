#!/bin/bash

#--------------#
# waybar setup #
#--------------#

CONFIG_DIR=$HOME/.config/waybar/
mkdir -p $CONFIG_DIR

if [[ -f $CONFIG_DIR/waybar.css ]]; then
	echo "Backing Up waybar.css"
	mv $CONFIG_DIR/waybar.css $CONFIG_DIR/waybar.css.bak
fi

if [[ -f $CONFIG_DIR/waybar.json ]]; then
	echo "Backing Up waybar.json"
	mv $CONFIG_DIR/waybar.json $CONFIG_DIR/waybar.json.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking waybar.css"
ln -s $DOTFILES_DIR/waybar/waybar.css $CONFIG_DIR/waybar.css

echo "Linking waybar.json"
ln -s $DOTFILES_DIR/waybar/waybar.json $CONFIG_DIR/waybar.json
