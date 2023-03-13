#!/bin/bash

#-----------#
# Git Setup #
#-----------#

if [[ -f $HOME/.gitconfig ]]; then
	echo "Backing Up Gitconfig"
	mv $HOME/.gitconfig $HOME/.gitconfig.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)"

echo "Linking .gitconfig"
ln -s $DOTFILES_DIR/git/.gitconfig $HOME/.gitconfig

if ! command -v lazygit &>/dev/null; then
	echo "Installing Lazygit"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
	rm lazygit.tar.gz
fi
