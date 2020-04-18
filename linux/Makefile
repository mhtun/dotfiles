APT_INSTALL=apt-get install -y
APT_ADD=add-apt-repository
CP=cp
CURL=curl -fsSL

.PHONY: all build git python powerline

build:
	$(APT_INSTALL) build-essential 

vim:
	$(APT_INSTALL) vim

python:
	$(APT_INSTALL) python3 python3-pip

powerline: python
	pip3 install powerline-shell
	$(CP) bashrc ~/.bashrc

git: vim
	$(APT_INSTALL) git
	git config --global user.name "Min Tun"
	git config --global user.email "minhantun@gmail.com"

	git config --global core.editor vim
	git config --global diff.tool vimdiff
	git config --global merge.tool vimdiff
	git config --global merge.conflictstyle diff3
	git config --global mergetool.prompt false

docker:
	$(APT_INSTALL) apt-transport-https ca-certificates curl software-properties-common
	$(CURL) https://download.docker.com/linux/ubuntu/gpg | apt-key add -
	$(APT_ADD) "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	apt update
	$(APT_INSTALL) docker-ce
	usermod -aG docker ${USER}


all: build git powerline docker
