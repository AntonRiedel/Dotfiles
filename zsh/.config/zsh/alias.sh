###############################################################################
#     File Name           :     alias.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-03-12 16:54]
#     Last Modified       :     [2019-12-05 08:24]
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
alias pi="yay -S"
alias pu="yay -Syu"
alias pr="yay -Rns"
alias pq="yay -Ss"
alias cu="nmcli con up --ask"
alias vpn="sudo vpnc lrz"
alias make="make -j$(nproc)"

##custom commands
#search and edit a configuration file
ce() { $EDITOR "$(find $HOME/Dotfiles/* -type f | fzf)"; }
#connect to known host per ssh
sshc() { ssh "$(grep "^Host\ " $HOME/.ssh/config | awk '{print $2}' | fzf)"; }
#sshc() { ssh -A -t "$(cat $HOME/.ssh/config | grep "^Host\ " | awk '{print $2}' | fzf)"; }
#search and enter a subdirectory in your home directory
fd() { cd "$(find $HOME -type d 2>/dev/null | fzf)" && pwd && ls; }
#search for all pdf's in current directory and all subdirectories
pdfs() { zathura $(find $(pwd) -type f -name *.pdf | fzf); }
#search for a process and kill it
kp() { kill -s SIGRTMIN+15 "$(ps -e | fzf | awk '{ print $1 }')" 2>/dev/null; }
