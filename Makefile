PROFILE = laptop
DOTDROP = dotdrop -c config.yaml
DOTNET_VERSION ?= 10.0

.PHONY: all help system docker nvim deploy

all: system docker deploy

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

system: ## Install core packages and dev tools
	sudo pacman -Syu --needed --noconfirm \
		nvidia-container-toolkit python-uv \
		dotnet-sdk-$(DOTNET_VERSION) neovim

docker: ## Configure NVIDIA GPU bridge for Docker
	sudo nvidia-ctk runtime configure --runtime=docker
	sudo systemctl enable --now docker
	sudo usermod -aG docker $(USER)
	sudo systemctl restart docker

nvim: ## Install Python dependencies for Neovim (LazyVim)
	uv tool install dotdrop
	pip install --user terminaltexteffects

deploy: ## Apply dotfiles using dotdrop
	$(DOTDROP) install -p $(PROFILE)

test-gpu: ## Test if Docker can see the GTX 1650
	docker run --rm --gpus all nvidia/cuda:base nvidia-smi
