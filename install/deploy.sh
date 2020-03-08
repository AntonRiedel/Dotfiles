#! /bin/sh
###############################################################################
#     File Name           :     setup.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2020-02-01 12:34]
#     Last Modified       :     [2020-03-09 00:47]
#     Description         :     My deloyment script. Run on a fresh Arch Install
###############################################################################

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
cd ..
rm -rf ../.*[!.]
mkdir -p ../.local/bin ../.config
stow login sxhkd scripts dunst tmux zsh wallpaper zathura qutebrowser neofetch neovim htop
cd install

#download source for suckless utilities and install them
git clone --single-branch --branch my_dwm https://github.com/AntonRiedel/dwm
cd dwm
make
sudo make install
cd ..
rm -rf dwm

git clone --single-branch --branch my_st https://github.com/AntonRiedel/st
cd st
make
sudo make install
cd ..
rm -rf st
