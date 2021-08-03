#!/bin/bash

## Project:     Fedora Workstation
## Description: DevOps Engineer Workstation Running Fedora Linux
## Developer:   Gabriel Caussi
## Github:      https://github.com/gabrielcaussi
## Linkedin:    https://www.linkedin.com/in/gabrielcaussi

## Update System
sudo dnf update -y
sudo dnf upgrade -y

## Install non-free repository
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf update -y

## Install Softwares
sudo dnf install broadcom-wl -y
sudo dnf install ffmpeg util-linux-user wget xclip zsh curl git tmux neofetch htop neovim kitty hugo flameshot vagrant -y

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

## Install Visual Studio Code
if ! [ -x "$(command -v code)" ]; then
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' -y
  sudo dnf check-update -y
  sudo dnf install code -y
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

## Set Breeze Dark Theme
plasma-apply-lookandfeel -a org.kde.breezedark.desktop

## Set KDE Plasma Wallpaper
plasma-apply-wallpaperimage ~/dotfiles/wallpaper/wallpaper.png
