#!/bin/bash

#------------#
# tmux Setup #
#------------#

if [[ -f $HOME/.tmux.conf ]]; then
	echo "Backing Up tmux.conf"
	mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi

DOTFILES_DIR="$(git rev-parse --show-toplevel)"

echo "Linking .tmux.conf"
ln -s $DOTFILES_DIR/tmux/tmux.conf $HOME/.tmux.conf
