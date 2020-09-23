#!/bin/sh
# File              : .profile
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 23.09.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#set environment variables
export PATH="$HOME/.local/bin:$HOME/.local/share/nvim/plugged/fzf/bin:$PATH"
[ "$(hostname)" = "Mars" ] && export LIBGL_ALWAYS_SOFTWARE=1
export TERMINAL="alacritty"
#export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="$EDITOR"

#XDG
export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_DATA_HOME:=$HOME/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

#remove as many config files from $HOME as possible
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.vim"
export MYVIMCONFIG="$XDG_CONFIG_HOME/nvim/config"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export LESSHISTFILE="-"

#browser
export BROWSER="qutebrowser"
export BROWSER2="firefox"

#reader for pdf files
export READER="zathura"
export READER2="qpdfview"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"
export FZF_DEFAULT_COMMAND="rg --files"

#wallpaper
export WALLPAPER="$HOME/nextcloud/wallpaper/arch4.png"

#start Xorg on tty1
[ "$(tty)" = "/dev/tty1" ] && exec startx &>/dev/null
