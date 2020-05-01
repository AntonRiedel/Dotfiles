#!/bin/sh
# File              : .bashrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 28.04.2020
# Last Modified Date: 30.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#misc settings for bash shell
shopt -s autocd
bind 'set completion-ignore-case on'
stty -ixon
set -o vi

#infinite history
HISTFILESIZE=
HISTSIZE=

#ignore repeated commands
export HISTCONTROL=ignoredups

#commandline prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
