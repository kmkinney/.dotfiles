#!/bin/bash

DOTFILES_DIR="$(git rev-parse --show-toplevel)"

PS3="Choose a config to setup: "
CONFIGS="neovim vim git alacritty tmux bash zsh quit"
select config in $CONFIGS; do
	case "$config" in
	neovim)
		echo "neovim"
		source $DOTFILES_DIR/nvim/nvimsetup.sh
		;;
	vim)
		echo "vim"
		source $DOTFILES_DIR/vim/vimsetup.sh
		;;
	zsh)
		echo "zsh"
		source $DOTFILES_DIR/zsh/zshsetup.sh
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
