#!/bin/bash

#  _              _    _
# | |            | |  (_)
# | | ___ __ ___ | | ___ _ __  _ __   ___ _   _
# | |/ / '_ ` _ \| |/ / | '_ \| '_ \ / _ \ | | |
# |   <| | | | | |   <| | | | | | | |  __/ |_| |
# |_|\_\_| |_| |_|_|\_\_|_| |_|_| |_|\___|\__, |
#                                          __/ |
#                                         |___/
# shell installers
# installs commands that use one-liners in bash
# checks if already installed first
DOTFILES_DIR="$(git rev-parse --show-toplevel)"

if command -v pacman &>/dev/null; then
	echo "using pacman, syncing necessary packages"
	sudo pacman -Syu --needed - <$DOTFILES_DIR/arch/pkglist.txt
fi

if ! command -v curl &>/dev/null; then
	echo "curl required to install these programs"
	exit 1
fi

if [[ ! -d ~/.nvm ]]; then
	echo "Installing nvm"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
else
	echo "NVM already installed"
fi

if ! command -v lazygit &>/dev/null; then
	echo "Installing Lazygit"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
	rm lazygit.tar.gz
else
	echo "Lazygit already installed"
fi
