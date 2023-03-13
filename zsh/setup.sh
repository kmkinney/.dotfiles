# /////////////////////////////
# // Kevin ZSH Setup Script
# /////////////////////////////

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# ZSH Plugins go here
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/git-open

# Remove any old config file
rm -f $HOME/.zshrc

[[ ! -f $HOME/.zshrc ]] && ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
[[ ! -f $HOME/.p10k.zsh ]] && ln -s $HOME/.dotfiles/zsh/.p10k.zsh $HOME/.p10k.zsh
