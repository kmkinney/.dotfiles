# How to install stow without sudo

## Make sure perl is installed


wget https://ftp.gnu.org/gnu/stow/stow-2.3.1.tar.gz
tar -xvf stow-2.3.1.tar.gz

cd stow-2.3.1.tar.gz

./configure --prefix=$HOME/.local
make install prefix=$HOME/.local

## Set the path in .bashrc using this

export PATH=$PATH:$HOME/.local/bin

