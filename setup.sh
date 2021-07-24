#!/bin/bash

## Project:     Install Dotfiles
## Description: Dotfiles for DevOps Engineer running Fedora Linux
## Developer:   Gabriel Caussi
## Github:      https://github.com/gabrielcaussi
## Linkedin:    https://www.linkedin.com/in/gabrielcaussi

## Create directory ~/.config
mkdir ~/.config

## ====================================================================
##      Configure Kitty
## ====================================================================

## Symbolic link
ln -sf ~/dotfiles/.config/kitty/ ~/.config/

## ====================================================================
##      Configure Neovim
## ====================================================================

## Install Vim-plug
curl -fLo ~/dotfiles/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Symbolic link
ln -sf ~/dotfiles/.config/nvim/ ~/.config/

## ====================================================================
##      Configure Git
## ====================================================================

## Symbolic link
ln -sf ~/dotfiles/.gitconfig ~/

## ====================================================================
##      Configure Tmux
## ====================================================================

## Symbolic link
ln -sf ~/dotfiles/.tmux.conf ~/

## ====================================================================
##      Configure ZSH
## ====================================================================

## Install Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Change default Shell to ZSH
chsh -s /bin/zsh

## Symbolic link
ln -sf ~/dotfiles/.zshrc ~/

## ====================================================================
##      Configure Fonts
## ====================================================================

## Symbolic link
ln -sf ~/dotfiles/.fonts/ ~/
