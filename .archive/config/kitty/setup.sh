#!/bin/bash

#-------------#
# kitty setup #
#-------------#

CONFIG_DIR=$HOME/.config/kitty/
mkdir -p $CONFIG_DIR

if [[ -f $CONFIG_DIR/kitty.conf ]]; then
	echo "Backing Up kitty.conf"
	mv $CONFIG_DIR/kitty.conf $CONFIG_DIR/kitty.conf.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking kitty.conf"
ln -s $DOTFILES_DIR/kitty/kitty.conf $CONFIG_DIR/kitty.conf
