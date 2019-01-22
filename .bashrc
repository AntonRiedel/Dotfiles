## ~/.bashrc #

##If not running interactively, don't do anything
[[ $- != *i* ]] && return
##misc settings
shopt -s autocd
stty -ixon 
set -o vi

##set the prompter
PS1='[\[\033[1;34m\]\u\[\033[0m\]@\h \W]\$ '

##set c/c++ compiler
export CC=$(which gcc)
export CXX=$(which g++)
#export CC=$(which clang)
#export CXX=$(which clang++)

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf="zathura"
alias m="neomutt"
alias v="vim"
alias r="ranger"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias pr="sudo pacman -Rns"
alias pq="pacman -Ss"
alias cu="nmcli con up --ask"
alias dot="/usr/bin/git --git-dir=$HOME/.Dotfiles/ --work-tree=$HOME"
