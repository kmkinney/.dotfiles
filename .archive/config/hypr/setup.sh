#!/bin/bash

#----------------#
# Hyprland Setup #
#----------------#

HYPR_DIR=~/.config/hypr/

mkdir -p $HYPR_DIR

if [[ -f $HYPR_DIR/hyprland.conf ]]; then
	echo "Backing Up Hyprland Config"
	mv $HYPR_DIR/hyprland.conf $HYPR_DIR/hyprland.conf.bak
fi

if [[ -f $HYPR_DIR/hyprpaper.conf ]]; then
	echo "Backing Up hyprpaper Config"
	mv $HYPR_DIR/hyprpaper.conf $HYPR_DIR/hyprpaper.conf.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)/config"

echo "Linking Hypland and Hyprpaper Configs to $HYPR_DIR"
ln -s $DOTFILES_DIR/hypr/hyprland.conf $HYPR_DIR/hyprland.conf
ln -s $DOTFILES_DIR/hypr/hyprpaper.conf $HYPR_DIR/hyprpaper.conf
