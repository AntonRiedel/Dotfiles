#! /bin/sh
###############################################################################
#     File Name           :     environment.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-03-12 16:42]
#     Last Modified       :     [2019-10-01 22:42]
#     Description         :     Runs on login
###############################################################################

#set environment variables
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MYVIMRC="$HOME/.config/nvim/init.vim"
export MYVIMCONFIG="$HOME/.config/nvim/config"

#~/.local/bin/vifm is a custom script to launch vifm with image preview
#it will be started instead of /usr/bin/vifm since it appears first in PATH
export FILE="$HOME/.local/bin/vifm"
export FILE2="pcmanfm"

#main browser
export BROWSER="qutebrowser"

#backup browser
export BROWSER2="firefox"

#reader for pdf files
export READER="zathura"
export READER2="evince"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

echo "$0" | grep "bash$" >/dev/null && [ -f $HOME/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if dwm is not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx >&/dev/null
