#!/bin/sh
# File              : deploy.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 25.03.2020
# Last Modified Date: 29.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

install_yay () {
#download and install yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin
}

#install packages as given by package.install
install_packages() {
yay -Syu
yay -S --needed - < packages.install
}

#install flatpaks
install_flatpaks() {
flatpak install $(cat flatpaks.install)
}

#deploy config file with stow
deploy_config_all(){
rm -rf $HOME/.*[!.]
mkdir -p $HOME/.local/bin $HOME/.config
stow -d $HOME/Dotfiles -t $HOME $(find $HOME/Dotfiles -maxdepth 1 -type d ! \( -path $HOME/Dotfiles -o -name old -o -name install -o -name .git \) | cut --delimiter=/ -f 5)
}

#download source for suckless utilities and install them
install_suckless(){
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

cd $HOME/Dotfiles/install
}
