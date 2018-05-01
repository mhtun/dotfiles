.PHONY: all neovim install_venv_deps

install_neo_deps:
	sudo apt-get install neovim python-neovim python3-neovim fonts-powerline

neovim: install_neo_deps
	mkdir -p ~/.config/nvim/plugged
	mkdir -p ~/.config/nvim/autoload
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp init.vim ~/.config/nvim

install_venv_deps:
	sudo apt-get install python3-venv

all: neovim install_venv_deps
