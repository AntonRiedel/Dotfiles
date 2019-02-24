#! /bin/bash
#################################################################################
#     File Name           :     alias.bashrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-24 12:09]
#     Last Modified       :     [2019-02-24 12:09]
#     Description         :     Aliases for bash shell
#################################################################################

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf=$READER
alias pdf2=$READER2
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

##custom commands
se() { du -a ~/.local/bin/* ~/.config/* | awk '{print $2}' | fzf | xargs  -r $EDITOR ;}
vf() { fzf | xargs -r -I % $EDITOR % ;}
