echo "installing neovim"
echo "*****************"
sudo apt install neovim python-neovim python3-neovim

# sudo dnf install neovim python-neovim python3-neovim

echo "creating directories"
echo "********************"
mkdir -p ~/.config/nvim/plugged
echo "created ~/.config/nvim/plugged"
mkdir -p ~/.config/nvim/autoload
echo "created ~/.config/nvim/autoload"

echo "downloading vim-plug"
echo "********************"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "download complete"

echo "installing nvim config"
echo "**********************"
cp init.vim ~/.config/nvim/
echo "install complete"
