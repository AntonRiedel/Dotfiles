###############################################################################
#     File Name           :     alias.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-03-12 16:54]
#     Last Modified       :     [2019-03-12 16:55]
#     Description         :     Aliases for the shell
###############################################################################

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf=$READER
alias pdf2=$READER2
alias m="neomutt"
alias v=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR
alias vifm=$FILE
alias vf=$FILE
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu && yay -Sua"
alias pr="sudo pacman -Rns"
alias pq="pacman -Ss"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc"

##custom commands
#search and edit a configuration file
ce() { find $HOME/Dotfiles/* -type f | fzf | xargs -r -I % $EDITOR %; }
#search and enter a directory in $HOME
fd() { cd "$(find $HOME/* -type d | fzf)" && pwd && ls; }
