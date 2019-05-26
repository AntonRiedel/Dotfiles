###############################################################################
#     File Name           :     alias.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-03-12 16:54]
#     Last Modified       :     [2019-05-26 14:20]
#     Description         :     Aliases for the shell
###############################################################################

##aliases
alias ls="ls --color=auto"
alias ll="ls -al -h --color=auto"
alias pdf="$READER"
alias pdf2="$READER2"
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias diff="$EDITOR -d"
alias vf="$FILE"
alias vif="$FILE"
alias vifm="$FILE"
alias xi="sudo xbps-install -Sv"
alias xu="sudo xbps-install -Suv"
alias xr="sudo xbps-remove -Rv"
alias xq="xbps-query -Rs"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc"
alias fullclean='make clean && rm -f config.h && git reset --hard origin/master'

##custom commands
#search and edit a configuration file
ce() { nvim "$(find $HOME/Dotfiles/* -type f | fzf)"; }
#connect to known host per ssh
sshc() { ssh "$(cat $HOME/.ssh/config | grep "Host\ " | awk '{print $2}' | dmenu)"; }
#search and enter a directory (fails if you lack permissions)
fd() { cd "$(find / -type d 2>/dev/null | fzf)" && pwd && ls; }
#search for a process and kill it
kp() { kill -s SIGRTMIN+15 "$(ps -e | fzf | awk '{ print $1 }')" 2>/dev/null; }
