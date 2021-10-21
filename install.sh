#!/bin/bash

# Project     : Linux Mint Workstation
# Description : Workstation Running Linux Mint
# Developer   : Gabriel Caussi
# Github      : https://github.com/gabrielcaussi
# Linkedin    : https://www.linkedin.com/in/gabrielcaussi

## Update System
sudo apt update -y
sudo apt upgrade -y

## Install wifi module for Thinkpad E431 (BCM43142)
sudo apt install broadcom-sta-dkms -y

## Install dependencies and softwares
sudo apt install util-linux xclip ffmpeg wget curl git neofetch htop zsh tmux neovim kitty hugo flameshot fonts-roboto fonts-jetbrains-mono -y

## Install Google Chrome
if ! [ -x "$(command -v google-chrome)" ]; then
  sudo apt install https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -y
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
gsettings set org.gnome.cinnamon.interface gtk-theme "Flat-Remix-GTK-Teal-Dark"
gsettings set org.gnome.cinnamon.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.cinnamon.interface cursor-theme "cursor"

## Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## ZSH
ln -sf ~/dotfiles/.zshrc ~/

## Change default Shell to ZSH
chsh -s /bin/zsh
