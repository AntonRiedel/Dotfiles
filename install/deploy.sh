#!/bin/sh
# File              : deploy.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 25.03.2020
# Last Modified Date: 27.04.2020
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

#install flatpaks
flatpak install $(cat flatpaks.install)

#deploy config file with stow
rm -rf $HOME/.*[!.]
mkdir -p $HOME/.local/bin $HOME/.config
stow -d $HOME/Dotfiles -t $HOME $(find $HOME/Dotfiles -maxdepth 1 -type d ! \( -path $HOME/Dotfiles -o -name old -o -name install -o -name .git \) | cut --delimiter=/ -f 5)

#download source for suckless utilities and install them
mkdir $HOME/repos
cd $HOME/repos

git clone https://github.com/AntonRiedel/dwm
cd dwm
git checkout my_dwm
make
sudo make install
cd ..

git clone https://github.com/AntonRiedel/dmenu
cd dmenu
git checkout my_dmenu
make
sudo make install
cd ..

git clone https://github.com/AntonRiedel/st
cd st
git checkout my_st
make
sudo make install
cd ..

cd $HOME/Dotfiles
