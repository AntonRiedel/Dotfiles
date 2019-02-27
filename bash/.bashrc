###############################################################################
#     File Name           :     .bashrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:40]
#     Last Modified       :     [2019-02-26 15:32]
#     Description         :     Bashrc
###############################################################################

##misc settings
shopt -s autocd
stty -ixon 
set -o vi

##set the prompter
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#load bash aliases
[ -f "$HOME/.config/alias.bashrc" ] && source "$HOME/.config/alias.bashrc"
