## ~/.bashrc #

##If not running interactively, don't do anything
[[ $- != *i* ]] && return

##misc settings
shopt -s autocd
stty -ixon 
set -o vi

##set the prompter
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

##source files for fzf
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

##set c/c++ compiler
export CC=$(which gcc)
export CXX=$(which g++)
#export CC=$(which clang)
#export CXX=$(which clang++)
#export CC=$(which tcc)

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf="zathura"
alias m="neomutt"
alias v="vim"
alias r="ranger"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu && yay -Sua"
alias pr="sudo pacman -Rns"
alias pq="pacman -Ss"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc"
