###############################################################################
#     File Name           :     alias.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-03-12 16:54]
#     Last Modified       :     [2019-03-13 17:23]
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
ce() { nvim $(find $HOME/Dotfiles/* -type f | fzf); }
#search and enter a directory (fails if you lack permissions)
fd() { cd "$(find / -type d 2>/dev/null | fzf)" && pwd && ls; }
#search and execute a command from history
hs() { $(cat "$HOME/.bash_history" | sort -u | fzf); }
#search for a process and kill it
kp() { kill -s SIGRTMIN+15 "$(ps -e | fzf | awk '{ print $1 }')" 2>/dev/null; }
