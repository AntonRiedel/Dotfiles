#! /bin/sh
###############################################################################
#     File Name           :     environment.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-03-12 16:42]
#     Last Modified       :     [2019-06-02 16:58]
#     Description         :     Runs on login
###############################################################################

#set environment variables
export PATH="$HOME/.local/bin:$PATH"

export TERMINAL="st"

export EDITOR="nvim"
export VISUAL=$EDITOR
export MYVIMRC="$HOME/.config/nvim/init.vim"
export MYVIMCONFIG="$HOME/.config/nvim/config"

#~/.local/bin/vifm is a custom script to launch vifm with image preview
#it will be started instead of /usr/bin/vifm since it appears first in PATH
export FILE="$HOME/.local/bin/vifm"

#main browser
export BROWSER="qutebrowser"

#backup browser
export BROWSER2="firefox"

#reader for pdf files
export READER="zathura"
export READER2="evince"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

echo "$0" | grep "bash$" >/dev/null && [ -f $HOME/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if dwm is not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
