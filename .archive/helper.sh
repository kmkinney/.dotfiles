#!/bin/bash

#  _              _    _
# | |            | |  (_)
# | | ___ __ ___ | | ___ _ __  _ __   ___ _   _
# | |/ / '_ ` _ \| |/ / | '_ \| '_ \ / _ \ | | |
# |   <| | | | | |   <| | | | | | | |  __/ |_| |
# |_|\_\_| |_| |_|_|\_\_|_| |_|_| |_|\___|\__, |
#                                          __/ |
#                                         |___/
# dotfiles helper functions (to practice bash)

link_config_file() {
	exit 0
}

get_dotfiles_directory() {
	exit 0
	DOTFILES_DIR="$(git rev-parse --show-toplevel)"
}

setup_menu() {
	PS3="Choose a config to setup: "
	CONFIGS="neovim vim git alacritty tmux bash zsh quit"
	select config in $CONFIGS; do
		case "$config" in
		neovim)
			echo "neovim"
			# $HOME/.dotfiles/nvim/nvimsetup.sh
			;;
		vim)
			echo "vim"
			;;
		quit)
			echo "done"
			exit 0
			;;
		*)
			echo "Invalid option ${REPLY}"
			;;
		esac
	done
}

# PS3="Enter a letter: "
# select ITEM in a b c d; do
# 	echo $ITEM
# done
#
# setup_menu

whiptail --msgbox --title "Hello World" "Testing" 35 80
