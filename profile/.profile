#!/bin/sh
# File              : .profile
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 11.03.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#add $HOME/.local/bin to PATH
export PATH="${HOME}/.local/bin:${PATH}"

#set default applications
export TERMINAL="alacritty"
# export TERMINAL="kitty"
#export TERMINAL="st"
[ "$(which nvim)" ] && export EDITOR="nvim" || export EDITOR="vim"
export VISUAL="${EDITOR}"
export BROWSER="qutebrowser"
export BROWSER2="firefox"
export READER="zathura"
export READER2="qpdfview"
#make alacritty work on X200
[ "$(cat /etc/hostname 2>/dev/null)" = "Mars" ] && export LIBGL_ALWAYS_SOFTWARE=1

#XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

#remove as many config files from $HOME as possible
export MYVIMRC="${XDG_CONFIG_HOME}/nvim/init.vim"
export INPUTRC="${XDG_CONFIG_HOME}/inputrc"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME}/notmuch-config"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/password-store"
export HISTFILE="${XDG_DATA_HOME}/shell_history"
export LESSHISTFILE="-"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"

#set default wallpaper
export WALLPAPER="${HOME}/nextcloud/wallpaper/arch4.png"

#start Xorg
[ "$(tty)" = "/dev/tty1" ] && exec startx $XDG_CONFIG_HOME/X11/xinitrc &>/dev/null
[ "$(tty)" = "/dev/tty2" ] && exec qtile start -b wayland
