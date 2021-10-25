#!/bin/bash

# Project     : Void Linux Workstation
# Description : Workstation for DevOps Running Void Linux
# Developer   : Gabriel Caussi
# Github      : https://github.com/gabrielcaussi
# Linkedin    : https://www.linkedin.com/in/gabrielcaussi

## Update System
sudo xbps-install -Suy

## Install wifi module for Thinkpad E431 (BCM43142)
sudo xbps-install -Sy broadcom-wl-dkms

## Install dependencies and softwares
sudo xbps-install -Sy util-linux xclip ffmpeg wget curl git neofetch htop zsh tmux neovim kitty hugo flameshot vscode fonts-roboto-ttf

## Install Google Chrome
sudo xbps-install git base-devel xtools
git clone https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
echo XBPS_ALLOW_RESTRICTED=yes >> ~/void-packages/etc/conf
./xbps-src pkg google-chrome
sudo xbps-install --repository=/home/seu-usuario/void-packages/hostdir/binpkgs/nonfree google-chrome

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
rm -rf ~/.icons
ln -sf ~/dotfiles/.icons/ ~/
gsettings set org.cinnamon.desktop.interface cursor-theme "cursor"
gsettings set org.gnome.desktop.background picture-uri file:///$HOME/dotfiles/wallpapers/wallpaper.jpg

## Fonts
ln -sf ~/dotfiles/.fonts ~/

## Oh-My-Zsh
RUN_ZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## ZSH
ln -sf ~/dotfiles/.zshrc ~/

## Change default Shell to ZSH
chsh -s /bin/zsh
