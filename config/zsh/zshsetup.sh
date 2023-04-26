#!/bin/bash

# /////////////////////////////
# // Kevin ZSH Setup Script
# /////////////////////////////
DOTFILES_DIR="$(git rev-parse --show-toplevel)"

# Install oh my zsh
if [[ ! -d ~/.oh-my-zsh/ ]]; then
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	# ZSH Plugins go here
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone --depth=1 https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/git-open
fi

# Remove any old config file
if [[ -f ~/.zshrc ]]; then
	echo "Backing up old zshrc"
	mv ~/.zshrc ~/.zshrc.bak
fi

if [[ -f ~/.p10k.zsh ]]; then
	echo "Backing up powerline config"
	mv ~/.p10k.zsh ~/.p10k.zsh.bak
fi

echo "Creating symlinks for zsh and powerline"
ln -s $DOTFILES_DIR/zsh/zshrc.zsh ~/.zshrc
ln -s $DOTFILES_DIR/zsh/p10k.zsh ~/.p10k.zsh
