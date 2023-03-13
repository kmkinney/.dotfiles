#echo "Installing docker"
#curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh

#echo "Installing aws cli v2"
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#sudo ./aws/install
#rm -rf awscliv2.zip aws/

echo "Installing nvm"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#echo "Installing tfenv"
#mkdir $HOME/.tfenv
#git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
#ln -s $HOME/.tfenv/bin/* $HOME/.local/bin
