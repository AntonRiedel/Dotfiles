#!/bin/sh
# File              : .profile
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 02.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#set environment variables
export PATH="$HOME/.local/bin:$HOME/.local/share/nvim/plugged/fzf/bin:$PATH"
[ "$(hostname)" = "Mars" ] && export LIBGL_ALWAYS_SOFTWARE=1
export TERMINAL="alacritty"
#export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MYVIMRC="$HOME/.config/nvim/init.vim"
export MYVIMCONFIG="$HOME/.config/nvim/config"

#remove as many config files from $HOME as possible
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export LESSHISTFILE="-"
export ZDOTDIR="$HOME/.config/zsh"
export GNUPGHOME="$HOME/.config/gnupg"

#browser
export BROWSER="qutebrowser"
export BROWSER2="firefox"

#reader for pdf files
export READER="zathura"
export READER2="qpdfview"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

#wallpaper
export WALLPAPER="$HOME/nextcloud/wallpaper/arch4.png"

#start Xorg on tty1
[ "$(tty)" = "/dev/tty1" ] && exec startx &>/dev/null
