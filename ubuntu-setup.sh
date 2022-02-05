#!/bin/bash

# gitconfig
if [ ! -f $HOME/.gitconfig ]
then
    echo "Linking .gitconfig file..."
    ln -s $PWD/git/.gitconfig $HOME/.gitconfig
else
    echo ".gitconfig already found"
fi

# vim config
if [ ! -d $HOME/.vim ]
then
    echo "Setting up vim"
    [[ -d $HOME/.vim ]] || mkdir $HOME/.vim
    [[ -d $HOME/.vim/bundle ]] || mkdir $HOME/.vim/bundle

    ln -s $PWD/vim/.vimrc $HOME/.vimrc
    ln -s $PWD/vim/.vim/*.vim $HOME/.vim/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Running plugin install"
    vim +PluginInstall +qall
else
    echo "Vim config already found"
fi

# Neovim Setup
if [ ! -f $HOME/.nvimrc ]
then
    echo "Setting up neovim"
    ln -s $PWD/nvim/.nvimrc $HOME/.nvimrc
    mkdir -p $HOME/.config/nvim
    ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
else
    echo "Neovim config already found"
fi

# Alacritty Setup
if [ ! -d $HOME/.config/alacritty ]
then
    echo "Setting up alacritty"
    mkdir -p $HOME/.config/alacritty
    ln -s $PWD/alacritty/alacritty.yml $HOME/.config/alacritty/
else
    echo "alacritty config already found"
fi

# Tmux setup
if [ ! -f $HOME/.tmux.conf ]
then
    echo "Setting up tmux"
    ln -s $PWD/tmux/.tmux.conf $HOME/.tmux.conf
    ln -s $PWD/tmux/.tmux.conf.local $HOME/.tmux.conf.local
else
    echo "Tmux configuration already found"
fi

# Bash Aliases
if [ ! -f $HOME/.bash_aliases ]
then
    echo "Setting up bash aliases"
    ln -s $PWD/bash/.bash_aliases $HOME/.bash_aliases
else
    echo "Bash Aliases already found"
fi
