#! /bin/sh
###############################################################################
#     File Name           :     environment.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-03-12 16:42]
#     Last Modified       :     [2020-01-14 22:00]
#     Description         :     Runs on login
###############################################################################

#set environment variables
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MYVIMRC="$HOME/.config/nvim/init.vim"
export MYVIMCONFIG="$HOME/.config/nvim/config"

#remove as many config files from $HOME as possible
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export LESSHISTFILE="-"
export ZDOTDIR="$HOME/.config/zsh"

#~/.local/bin/vifm is a custom script to launch vifm with image preview
#it will be started instead of /usr/bin/vifm since it appears first in PATH
export FILE="$HOME/.local/bin/vifm"
export FILE2="pcmanfm"

#browser
export BROWSER="qutebrowser"
export BROWSER2="firefox"

#reader for pdf files
export READER="zathura"
export READER2="evince"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

# Start graphical server if dwm is not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx >&/dev/null
