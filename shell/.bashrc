#!/bin/sh
# File              : .bashrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 28.04.2020
# Last Modified Date: 09.08.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#misc settings for bash shell
shopt -s autocd cdspell nocaseglob
stty -ixon
set -o vi
complete -c man which whereis
complete -cf sudo

##history setup
#do not duplicate commands
HISTCONTROL="ignoreboth:erasedups"

# append to the history file, don't overwrite it
shopt -s histappend
# append and reload the history after each command
PROMPT_COMMAND="history -a; history -n"

# ignore certain commands from the history
HISTIGNORE="ls:ll:cd:pwd:bg:fg:fd:history:clear"

#set history length
HISTSIZE=10000
HISTFILESIZE=10000

#commandline prompt
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 7)\] \[$(tput setaf 5)\]\w
> \[$(tput sgr0)\]"

#aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# fzf
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# remote specifig config
[ -f "$HOME/.bashrc_remote" ] && source "$HOME/.bashrc_remote"
