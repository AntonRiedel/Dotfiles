#!/bin/bash
# File              : deploy.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 25.03.2020
# Last Modified Date: 19.05.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#include dowloading languageserver binaries
#https://github.com/latex-lsp/texlab/releases/download/v2.2.0/texlab-x86_64-linux.tar.gz

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

	echo "Install all packages given by packages.install (this includes AUR packages)"

	[ -z $(which yay) ] && echo "yay is not installed. Aborting..." && return 1

	yay -Syu --noconfirm --needed - <packages.install

	return 0
}

#Install_flatpaks() {
#    #install flatpaks

#    echo "May fail if you updated/installed a kernel previously"
#    [ -z $(which flatpak) ] && echo "flatpak is not installed. Aborting..." && return 1
#    flatpak install $(cat flatpaks.install)

#    return 0
#}

Deploy_config_all() {
	#deploy all config files with stow

	echo "Install all config files to $HOME"

	[ -z $(which stow) ] && echo "stow is not installed. Aborting ..." && return 1

	#make directories for scirpts and config files
	mkdir -p $HOME/.local/{bin,share} $HOME/.config
	stow -d $DotDir -t $HOME $(find $DotDir -maxdepth 1 -type d ! \( -path $DotDir -o -name old -o -name install -o -name .git \) -exec basename {} \;)

	return 0
}

Deploy_config_remote() {
	#deploy selected config files for a remote server without stow

	echo "Install selected config files to $HOME"

	#make directories for scirpts and config files
	mkdir -p $HOME/.local/bin $HOME/.local/share $HOME/.config

	#create symlinks
	ln -sf $DotDir/bash/.bashrc $HOME/.bashrc
	ln -sf $DotDir/bash/.bash_profile $HOME/.bash_profile
	ln -sf $DotDir/bash/.config/inputrc $HOME/.config/inputrc
	ln -sf $DotDir/login/.profile $HOME/.profile
	ln -sf $DotDir/scripts/.config/aliasrc $HOME/.config/aliasrc
	ln -sf $DotDir/tmux/.tmux.conf $HOME/.tmux.conf
	ln -sf $DotDir/tmux/.config/tmuxp $HOME/.tmuxp
	ln -sf $DotDir/git/.config/git $HOME/.config/git

	return 0
}

Install_suckless() {
	#download custom suckless utilities and install them

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

Info() {
	#display error message
	cat <<'EOF'
Supply one or more of the following options:
-a Install everything
-p Install packages specified py package.install
-d Deploy all config files
-r Deploy selected config files for remote servers
-s Install suckless utilities"
EOF
}

#protect against no flags
[ $# -eq 0 ] && Info

#set root of dotfiles directory
DotDir=$(dirname $PWD)

while getopts "arpfds" opt; do
	case $opt in
	a)
		echo "Install everything"
		Install_yay
		Install_packages
		Install_suckless
		Deploy_config_all
		;;
	p)
		echo "Install packages"
		Install_packages
		;;
	d)
		echo "Deploy all config files"
		Deploy_config_all
		;;
	r)
		echo "Deploy selected config files for remote servers"
		Deploy_config_remote
		;;
	s)
		echo "Install suckless programs"
		Install_suckless
		;;
	\?)
		Info
		;;
	esac

done
