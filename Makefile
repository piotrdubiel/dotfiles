SHELL = /bin/bash
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TEMPORARY_DIR := $(DOTFILES_DIR)/tmp
PATH := $(DOTFILES_DIR)/bin:$(PATH)

install: tmp sudo brew git zsh ruby oh-my-zsh vim firacode

tmp:
	mkdir $(TEMPORARY_DIR)

sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew:
	is_exec brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	@echo "Brew installed!"

git: brew git-install git-config
	

git-install:
	brew ls --versions git git-extras || brew install git git-extras
	@echo "Git installed!"

git-config: $(HOME)/.gitconfig
	cp $(DOTFILES_DIR)/gitconfig $(HOME)/.gitconfig
	@echo "Updated git config!"

zsh: sudo brew
	brew list zsh || brew install zsh
	chsh -s /usr/local/bin/zsh || true
	@echo "Zsh installed!"

oh-my-zsh: zsh
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	cp -r $(DOTFILES_DIR)/oh-my-zsh/* $(HOME)/.oh-my-zsh/custom/

ruby: brew
	brew list ruby || brew install ruby

vim:
	cp $(DOTFILES_DIR)/vimrc $(HOME)/.vimrc

$(TEMPORARY_DIR)/firacode: tmp
	git clone https://github.com/tonsky/FiraCode.git $(TEMPORARY_DIR)/firacode

firacode: $(TEMPORARY_DIR)/firacode
	cp $(TEMPORARY_DIR)/firacode/distr/ttf/* $(HOME)/Library/Fonts/

