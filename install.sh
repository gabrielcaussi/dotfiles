#!/bin/bash

# Project     : Xubuntu Workstation
# Description : Workstation for DevOps Running Xubuntu
# Developer   : Gabriel Caussi
# Github      : https://github.com/gabrielcaussi
# Linkedin    : https://www.linkedin.com/in/gabrielcaussi

## Update System
sudo apt update -y
sudo apt upgrade -y

## Install wifi module for Thinkpad E431 (BCM43142)
sudo apt install -y broadcom-sta-dkms

## Install dependencies and softwares
sudo pacman -Sy ubuntu-restricted-extras util-linux xclip ffmpeg wget curl git neofetch htop zsh tmux neovim kitty hugo flameshot

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

## Set theme, icons and wallpaper
xfconf-query -c xsettings -p /Net/ThemeName -s "Mojave-dark-solid"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "Mojave-dark-solid"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorLVDS-1/workspace0/last-image -s /home/gabrielcaussi/dotfiles/wallpapers/wallpaper.png

## Fonts
ln -sf ~/dotfiles/.fonts ~/

## Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## ZSH
ln -sf ~/dotfiles/.zshrc ~/

## Change default Shell to ZSH
chsh -s /bin/zsh
