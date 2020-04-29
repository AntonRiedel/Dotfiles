#!/bin/sh
# File              : .profile
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 29.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#set environment variables
export PATH="$HOME/.local/bin:$PATH"
#export TERMINAL="st"
#For use on X200
#env LIBGL_ALWAYS_SOFTWARE=1
export TERMINAL="alacritty"
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

#file browswer
export FILE="lf"

#browser
export BROWSER="qutebrowser"
export BROWSER2="firefox"

#reader for pdf files
export READER="zathura"
export READER2="qpdfview"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

# Start graphical server if Xorg is not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx >&/dev/null
