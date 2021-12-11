APT_UPDATE=sudo apt update
APT_INSTALL=sudo apt install -y
APT_ADD=sudo add-apt-repository -y
PIP_INSTALL=pip3 install
CP=cp
CURL=curl -fLo
MAKEDIR=mkdir -p
USER?=mintun
SHELL:=/bin/bash

.PHONY: all build git python powerline nvim

build_tools:
	$(APT_INSTALL) build-essential python3-neovim ripgrep

nvim:
	$(APT_ADD) ppa:neinstall -yovim-ppa/unstable
	$(APT_UPDATE)
	$(APT_INSTALL) neovim
	$(MAKEDIR) /home/$(USER)/.config/nvim/

kitty:
	$(APT_INSTALL) kitty
	$(MAKEDIR) /home/$(USER)/.config/kitty/

python:
	$(APT_INSTALL) python3 python3-pip

dotbot: python
	$(PIP_INSTALL) dotbot
	dotbot -c dotbot.conf.yaml

all: build_tools git dotbot
