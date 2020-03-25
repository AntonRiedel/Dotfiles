#!/bin/sh
# File              : deploy.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 25.03.2020
# Last Modified Date: 25.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#download and install yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

#install packages as given by package.install
yay -Syu
yay -S --needed - < packages.install

#deploy config file with stow
rm -rf $HOME/.*[!.]
mkdir -p $HOME/.local/bin $HOME/.config
stow --dir=$HOME/Dotfiles login sxhkd scripts dunst tmux zsh wallpaper zathura qutebrowser neofetch neovim htop

#download source for suckless utilities and install them
git clone --single-branch --branch my_dwm https://github.com/AntonRiedel/dwm
cd dwm
make
sudo make install
cd ..
rm -rf dwm

git clone --single-branch --branch my_dmenu https://github.com/AntonRiedel/dmenu
cd dmenu
make
sudo make install
cd ..
rm -rf dmenu

git clone --single-branch --branch my_st https://github.com/AntonRiedel/st
cd st
make
sudo make install
cd ..
rm -rf st
