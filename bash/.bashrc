## ~/.bashrc #

##If not running interactively, don't do anything
[[ $- != *i* ]] && return

##misc settings
shopt -s autocd
stty -ixon 
set -o vi

##set the prompter
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 28)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

##set c/c++ compiler
#export CC=$(which tcc)
export CC=$(which gcc)
export CXX=$(which g++)
#export CC=$(which clang)
#export CXX=$(which clang++)

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf="zathura"
alias m="neomutt"
alias v=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias r="ranger"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu && yay -Sua"
alias pr="sudo pacman -Rns"
alias pq="pacman -Ss"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc"
