#!/bin/sh
# File              : alias.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf="$READER"
alias pdf2="$READER2"
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias vb="$EDITOR -u NONE"
alias diff="$EDITOR -d"
alias pi="yay -S"
alias pu="yay -Syu"
alias pr="yay -Rns"
alias pq="yay -Ss"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc lrz"
alias make="make -j$(nproc)"

##custom commands (a.k.a. fun with fzf)
#search and edit a configuration file
ce() { $EDITOR "$(find $HOME/Dotfiles/* -type f | fzf --prompt="Edit config file: ")"; }
#connect to known host via ssh
sshc() { ssh "$(grep "^Host\ " $HOME/.ssh/config | awk '{print $2}' | fzf)"; }
#search and enter a subdirectory in your home directory
fd() { cd "$(find $HOME -type d 2>/dev/null | fzf  --prompt="Jump to Dir: ")" && pwd && ls; }
#search through history with fzf
hs() {echo "$(cat $HOME/.config/zsh/zsh_history | sort -u | fzf)"}
#search for a process and kill it
kp() { kill -s SIGKILL "$(ps -e | fzf | awk '{ print $1 }')" 2>/dev/null; }
