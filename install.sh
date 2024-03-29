#!/bin/bash

# Project     : Debian Workstation
# Description : Workstation for DevOps Running Debian
# Developer   : Gabriel Caussi
# Github      : https://github.com/gabrielcaussi
# Linkedin    : https://www.linkedin.com/in/gabrielcaussi

## Update System
sudo dnf update -y

## Install wifi module for Thinkpad E431 (BCM43142)
##sudo apt install broadcom-sta-dkms -y
sudo dnf install broadcom-wl

## Install dependencies and softwares
sudo dnf install util-linux xclip ffmpeg wget curl git neofetch htop zsh tmux neovim kitty hugo flameshot -y

## Install Google Chrome
##wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
##sudo apt install ./google-chrome-stable_current_amd64.deb
##rm google-chrome-stable_current_amd64.deb

## Install Visual Studio Code
# wget https://az764295.vo.msecnd.net/stable/6cba118ac49a1b88332f312a8f67186f7f3c1643/code_1.61.2-1634656828_amd64.deb
# sudo apt install ./code_1.61.2-1634656828_amd64.deb
# rm code_1.61.2-1634656828_amd64.deb

## Create directory ~/.config
mkdir ~/.config

## Create directory ~/Projects
mkdir ~/Projects

## Vim-plug
curl -fLo ~/dotfiles/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Neovim
ln -sf ~/dotfiles/.config/nvim/ ~/.config/
nvim +PlugInstall +qall

## Git
ln -sf ~/dotfiles/.gitconfig ~/

## Tmux
ln -sf ~/dotfiles/.tmux.conf ~/

## Fonts
ln -sf ~/dotfiles/.fonts ~/

## Bash
ln -sf ~/dotfiles/bash/.bashrc ~/
