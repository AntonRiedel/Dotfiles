#!/bin/sh
# File              : .bashrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 28.04.2020
# Last Modified Date: 18.03.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#misc settings for bash shell
shopt -s autocd
stty -ixon
set -o vi
complete -c man which whereis
complete -cf sudo

##history setup
#do not duplicate commands
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend
# append and reload the history after each command
export PROMPT_COMMAND="history -a; history -n"

# ignore certain commands from the history
export HISTIGNORE="ls:ll:cd:pwd:bg:fg:fd:history:clear"

#set history length
export HISTSIZE=10000
export HISTFILESIZE=10000

#commandline prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 7)\] \[$(tput setaf 5)\]\w
> \[$(tput sgr0)\]"

#aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

#remote specifig config
[ -f "$HOME/.bashrc_remote" ] && source "$HOME/.bashrc_remote"
