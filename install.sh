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

## Install dependencies and softwares
sudo dnf install util-linux-user xclip ffmpeg wget curl git neofetch htop zsh tmux neovim kitty hugo flameshot vagrant google-roboto-fonts -y

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

## Create directory ~/Projects
mkdir ~/Projects

## Kitty
ln -sf ~/dotfiles/.config/kitty/ ~/.config/

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

## Set themes, icons and cursors
ln -sf ~/dotfiles/.themes/ ~/
ln -sf ~/dotfiles/.icons/ ~/
gsettings set org.gnome.desktop.interface gtk-theme "dracula-theme"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Black-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "cursor-dracula"

## Fonts
ln -sf ~/dotfiles/.fonts/ ~/

## Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## ZSH
ln -sf ~/dotfiles/.zshrc ~/

## Change default Shell to ZSH
chsh -s /bin/zsh
