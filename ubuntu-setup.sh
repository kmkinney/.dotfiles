#!/bin/bash


# gitconfig
ln -s $PWD/git/.gitconfig $HOME/.gitconfig

# vim config
[[ -d $HOME/.vim ]] || mkdir $HOME/.vim
ln -s $PWD/vim/.vimrc $HOME/.vimrc
