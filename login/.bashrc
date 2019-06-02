###############################################################################
#     File Name           :     .bashrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:40]
#     Last Modified       :     [2019-06-02 16:44]
#     Description         :     bashrc
###############################################################################

#misc settings for bash shell
shopt -s autocd
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
