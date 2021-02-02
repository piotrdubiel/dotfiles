SHELL = /bin/bash
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)

install: sudo brew git zsh ruby oh-my-zsh

sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew:
	is_exec brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

git: brew
	brew install git git-extras
	cp $(DOTFILES_DIR)/gitconfig $(HOME)/.gitconfig

zsh: sudo brew
	brew list zsh || brew install zsh
	chsh -s /usr/local/bin/zsh

oh-my-zsh: zsh
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	cp -r $(DOTFILES_DIR)/oh-my-zsh/* $(HOME)/.oh-my-zsh/custom/

ruby: brew
	brew list ruby || brew install ruby
