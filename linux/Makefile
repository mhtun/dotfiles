APT_INSTALL=sudo apt install
CP=cp

.PHONY: all build git python

build:
  APT_INSTALL build-essential

python:
  APT_INSTALL python3 python3-pip
  pip3 install powerline-shell
  CP bashrc ~/.bashrc

git:
  APT_INSTALL git
  git config --global user.name "Min Tun"
  git config --global user.email "minhantun@gmail.com"

  git config --global core.editor vim
  git config --global diff.tool vimdiff
  git config --global merge.tool vimdiff
  git config --global merge.conflictstyle diff3
  git config --global mergetool.prompt false


all: build git python
