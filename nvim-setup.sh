cd $HOME/.dotfiles/nvim
mkdir -p $HOME/.config/nvim/lua/kevin/lsp/settings
NVIM_DIR=$(pwd -P)
for file in $(find $NVIM_DIR -type f); do
    echo "Linking $file"
    trimmed_file=$(echo $file | sed "s#$NVIM_DIR/##")
    echo $trimmed_file
    ln -sf $file $HOME/.config/nvim/$trimmed_file
done
