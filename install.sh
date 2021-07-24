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

## install Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code
