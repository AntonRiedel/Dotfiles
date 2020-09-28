#!/bin/sh
# File              : .profile
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 28.09.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#add $HOME/.local/bin to PATH as well as the path to the fzf binary; convinient on host where I cannot install fzf systemwide
export PATH="$HOME/.local/bin:$HOME/.local/share/nvim/plugged/fzf/bin:$PATH"

#make alacritty work on my X200
[ "$(hostname)" = "Mars" ] && export LIBGL_ALWAYS_SOFTWARE=1

#set default applications
export TERMINAL="alacritty"
#export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="qutebrowser"
export BROWSER2="firefox-nightly"
export READER="zathura"
export READER2="qpdfview"

#XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#remove as many config files from $HOME as possible
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
export MYVIMCONFIG="$XDG_CONFIG_HOME/nvim/config"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export HISTFILE="$XDG_DATA_HOME/history"
export LESSHISTFILE="-"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"
export FZF_DEFAULT_COMMAND="rg --files"

#set default wallpaper
export WALLPAPER="$HOME/nextcloud/wallpaper/arch4.png"

#start Xorg on tty1
[ "$(tty)" = "/dev/tty1" ] && exec startx &>/dev/null
