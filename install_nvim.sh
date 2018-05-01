echo "creating directories"
echo "********************"
mkdir -p ~/.config/nvim/plugged
mkdir -p ~/.config/nvim/autoload

echo "downloading vim-plug"
echo "********************"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing nvim config"
echo "**********************"
cp init.vim ~/.config/nvim/
