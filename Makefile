APT_UPDATE=sudo apt update
APT_INSTALL=sudo apt install -y
APT_ADD=sudo add-apt-repository -y
PIP_INSTALL=pip3 install
CP=cp
CURL=curl -fLo
MAKEDIR=mkdir -p
USER?=mintun
SHELL:=/bin/bash
FishSHELL:=/usr/bin/fish

.PHONY: all build python nvim astronvim fish starship

build_tools:
	$(APT_INSTALL) build-essential python3-neovim

nvim:
	$(CURL) nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	sudo mv nvim.appimage /usr/bin/nvim

fish:
	$(APT_INSTALL) fish
	chsh -s $(FishSHELL)

starship:
	curl -sS https://starship.rs/install.sh | sh

astronvim: nvim
	git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	nvim +PackerSync

kitty:
	$(APT_INSTALL) kitty
	$(MAKEDIR) /home/$(USER)/.config/kitty/

python:
	$(APT_INSTALL) python3 python3-pip

dotbot: python
	$(PIP_INSTALL) dotbot
	dotbot -c dotbot.conf.yaml

all: build_tools kitty starship fish astronvim
