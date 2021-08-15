#!/bin/bash

# Project     : Fedora Workstation
# Description : DevOps Engineer Workstation Running Fedora Linux
# Developer   : Gabriel Caussi
# Github      : https://github.com/gabrielcaussi
# Linkedin    : https://www.linkedin.com/in/gabrielcaussi

## Update System
sudo dnf update -y
sudo dnf upgrade -y

## Install fedora non-free repository
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf update -y

## Install wifi module for Thinkpad E431 (BCM43142)
sudo dnf install broadcom-wl -y

## Install BSPWM, dependencies and softwares
sudo dnf install bspwm ffmpeg wget curl xclip git neofetch htop rofi ranger feh mpv polybar zsh tmux neovim kitty hugo flameshot vagrant -y

## Install Google Chrome
if ! [ -x "$(command -v google-chrome)" ]; then
  sudo dnf install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -y
fi

## Install Virtualbox
if ! [ -x "$(command -v virtualbox)" ]; then
  sudo dnf install https://download.virtualbox.org/virtualbox/6.1.24/VirtualBox-6.1-6.1.24_145767_fedora33-1.x86_64.rpm -y
fi

## Create directory ~/.config
mkdir ~/.config

## Symbolic link Kitty
ln -sf ~/dotfiles/.config/kitty/ ~/.config/

## Install Vim-plug
curl -fLo ~/dotfiles/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Symbolic link Neovim
ln -sf ~/dotfiles/.config/nvim/ ~/.config/

## Symbolic link Git
ln -sf ~/dotfiles/.gitconfig ~/

## Symbolic link Tmux
ln -sf ~/dotfiles/.tmux.conf ~/

## Install Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Change default Shell to ZSH
chsh -s /bin/zsh

## Symbolic link ZSH
ln -sf ~/dotfiles/.zshrc ~/

## Symbolic link Fonts
ln -sf ~/dotfiles/.fonts/ ~/
