#!/bin/bash

## Project:     Fedora Workstation
## Description: DevOps Engineer Workstation Running Fedora Linux
## Developer:   Gabriel Caussi
## Github:      https://github.com/gabrielcaussi
## Linkedin:    https://www.linkedin.com/in/gabrielcaussi

echo ""
echo ""
echo " ___ _   _ ____ _____  _    _     _     _____ ____   "
echo "|_ _| \ | / ___|_   _|/ \  | |   | |   | ____|  _ \  "
echo " | ||  \| \___ \ | | / _ \ | |   | |   |  _| | |_) | "
echo " | || |\  |___) || |/ ___ \| |___| |___| |___|  _ <  "
echo "|___|_| \_|____/ |_/_/   \_\_____|_____|_____|_| \_\ "
echo ""
echo ""

## Update System
sudo dnf update -y
sudo dnf upgrade -y

## Install non-free repository
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf update -y

## Install Softwares
sudo dnf install broadcom-wl -y
sudo dnf install ffmpeg -y
sudo dnf install xclip -y
sudo dnf install zsh -y
sudo dnf install curl -y
sudo dnf install git -y
sudo dnf install tmux -y
sudo dnf install neofetch -y
sudo dnf install htop -y
sudo dnf install neovim -y
sudo dnf install kitty -y
sudo dnf install hugo -y
sudo dnf install flameshot -y
sudo dnf install vagrant -y
sudo dnf install util-linux-user -y
sudo dnf install wget -y

## Install Google Chrome
if ! [ -x "$(command -v google-chrome)" ]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
  sudo dnf install google-chrome-stable_current_x86_64.rpm -y
  rm google-chrome-stable_current_x86_64.rpm*
fi

## Install Virtualbox
if ! [ -x "$(command -v virtualbox)" ]; then
  wget https://download.virtualbox.org/virtualbox/6.1.24/VirtualBox-6.1-6.1.24_145767_fedora33-1.x86_64.rpm
  sudo dnf install VirtualBox-6.1-6.1.24_145767_fedora33-1.x86_64.rpm -y
  rm VirtualBox-6.1-6.1.24_145767_fedora33-1.x86_64.rpm*
fi

## ====================================================================
##      Configure Kitty
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.config/kitty/ ~/.config/

## ====================================================================
##      Configure Neovim
## ====================================================================

## Install Vim-plug
curl -fLo ~/.dotfiles/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Symbolic link
ln -sf ~/.dotfiles/.config/nvim/ ~/.config/

## ====================================================================
##      Configure Git
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.gitconfig ~/

## ====================================================================
##      Configure Tmux
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.tmux.conf ~/

## ====================================================================
##      Configure ZSH
## ====================================================================

## Install Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Change default Shell to ZSH
sudo chsh -s /bin/zsh

## Symbolic link
ln -sf ~/.dotfiles/.zshrc ~/

## ====================================================================
##      Configure Theme
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.themes/ ~/

## ====================================================================
##      Configure Icons
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.icons/ ~/

## ====================================================================
##      Configure Fonts
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.fonts/ ~/

## ====================================================================
##      Configure GTK
## ====================================================================

## Symbolic link
ln -sf ~/.dotfiles/.config/gtk-3.0/ ~/.config/
ln -sf ~/.dotfiles/.gtkrc-2.0 ~/
