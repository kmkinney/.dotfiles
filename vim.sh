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