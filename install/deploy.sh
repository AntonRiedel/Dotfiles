#!/bin/sh
# File              : deploy.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 25.03.2020
# Last Modified Date: 01.07.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

Install_yay() {
    #download and install yay-bin

    echo "Installing yay-bin as a wrapper for pacman"

    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ..
    rm -rf yay-bin

    return 0
}

Install_packages() {
    #install packages as given by package.install

    echo "Install all packages given by packages.install"

    #update base system first, then install the packages
    [ -z $(which yay) ] && echo "yay is not installed. Aborting..." && return 1
    yay -Syu
    yay -S --needed - <packages.install

    return 0
}

Install_flatpaks() {
    #install flatpaks

    echo "May fail if you update/installed a kernel"
    [ -z $(which flatpak) ] && echo "flatpak is not installed. Aborting..." && return 1
    #flatpak install $(cat flatpaks.install)
    flatpak install $(cat flatpaks.install)

    return 0
}

Deploy_config_all() {
    #deploy all config files with stow

    echo "Install all config files to $HOME"
    echo "WARNING! All hidden files in $HOME will be deleted"

    #clean $HOME
    rm -rf $HOME/.*[!.]

    #make directories for scirpts and config files
    mkdir -p $HOME/.local/bin $HOME/.config
    stow -d $DotDir -t $HOME $(find $HOME/Dotfiles -maxdepth 1 -type d ! \( -path $HOME/Dotfiles -o -name old -o -name install -o -name .git \) -exec basename {} \;)

    return 0
}

Deploy_config_remote() {
    #deploy selected config files for a remote server

    echo "Install selected config files to $HOME"

    #make directories for scirpts and config files
    mkdir -p $HOME/.local/bin $HOME/.config

    ln -s $DotDir/bash/.bashrc $HOME/.bashrc
    ln -s $DotDir/bash/.bash_profile $HOME/.bash_profile
    ln -s $DotDir/login/.profile $HOME/.profile
    ln -s $DotDir/git/.gitconfig $HOME/.gitconfig
    ln -s $DotDir/tmux/.tmux.conf $HOME/.tmux.conf

    ln -s $DotDir/nvim/.config/nvim $HOME/.config/nvim

    return 0
}

Install_suckless() {
    #download source for suckless utilities and install them

    #make a directory for personal repos
    echo "Cleaning out $HOME/repos"
    [ -d $HOME/repos ] && rm -rf $HOME/repos
    mkdir -p $HOME/repos
    cd $HOME/repos

    #install dwm
    git clone https://github.com/AntonRiedel/dwm.git
    cd dwm
    git checkout my_dwm
    make
    sudo make install
    cd ..

    #install st
    git clone https://github.com/AntonRiedel/st.git
    cd st
    git checkout my_st
    make
    sudo make install
    cd ..

    #install dmenu
    git clone https://github.com/AntonRiedel/dmenu.git
    cd dmenu
    git checkout my_dmenu
    make
    sudo make install
    cd ..

    cd $DotDir/install

    return 0
}

Error() {
    #display error message
    echo "Invalid input. Supply one or more of the following options:
    -a Install everything
    -p Install packages specified py package.install
    -f Install flatpaks specified by flatpak.install
    -d Deploy config files
    -s Install suckless utilities"
}

#protect against no flags
[ $# -eq 0 ] && Error

#set directory
DotDir=$(dirname $PWD)

while getopts "apfds" opt; do
    case $opt in
    a)
        echo "Install everything"
        Install_yay
        #Install_packages
        #Install_flatpaks
        #Install_suckless
        #Deploy_config_all
        ;;
    p)
        echo "Install packages"
        Install_packages
        ;;
    f)
        echo "Install flatpaks"
        Install_flatpaks
        ;;
    d)
        echo "Deploy all config files"
        #Deploy_config_all
        ;;
    s)
        echo "Install suckless programs"
        Install_suckless
        ;;
    \?)
        Error
        ;;
    esac

done
