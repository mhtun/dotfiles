APT_INSTALL=sudo apt install -y
APT_ADD=sudo add-apt-repository
CP=cp
CURL=curl -fLo
MAKEDIR=mkdir -p
USER?=mtun
SHELL:=/bin/bash

.PHONY: all build git python powerline nvim

build:
	$(APT_INSTALL) build-essential 

nvim:
	$(APT_INSTALL) neovim
	$(CURL) /home/$(USER)/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	$(MAKEDIR) /home/$(USER)/.config/nvim/
	$(CP) init.vim /home/$(USER)/.config/nvim

python:
	$(APT_INSTALL) python3 python3-pip

powerline: python
	$(APT_INSTALL) powerline fonts-powerline
	$(CP) bashrc ~/.bashrc
	source ~/.bashrc

git: nvim
	$(APT_INSTALL) git
	git config --global user.name "Min Tun"
	git config --global user.email "minhantun@gmail.com"

	git config --global core.editor nvim
	git config --global diff.tool vimdiff
	git config --global merge.tool vimdiff
	git config --global merge.conflictstyle diff3
	git config --global mergetool.prompt false

all: build git powerline
