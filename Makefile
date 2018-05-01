APT_INSTALL=sudo apt-get install
MKDIR=mkdir -p
CURL=curl -fLo
CP=cp

.PHONY: all neovim install_venv_deps

install_neo_deps:
	$(APT_INSTALL) neovim python-neovim python3-neovim fonts-powerline

neovim: install_neo_deps
	$(MKDIR) ~/.config/nvim/plugged
	$(MKDIR) ~/.config/nvim/autoload
	$(CURL) ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	$(CP) init.vim ~/.config/nvim

install_venv_deps:
	$(APT_INSTALL) python3-venv

all: neovim install_venv_deps
