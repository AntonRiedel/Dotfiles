###############################################################################
#     File Name           :     alias.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-03-12 16:54]
#     Last Modified       :     [2020-02-08 21:09]
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
ce() { $EDITOR "$(find $HOME/Dotfiles/* -type f | fzf)"; }
#connect to known host via ssh
sshc() { ssh "$(grep "^Host\ " $HOME/.ssh/config | awk '{print $2}' | fzf)"; }
#search and enter a subdirectory in your home directory
fd() { cd "$(find $HOME -type d 2>/dev/null | fzf)" && pwd && ls; }
#search through history with fzf
hs() {echo "$(cat $HOME/.config/zsh/zsh_history | sort -u | fzf)"}
#search for a process and kill it
kp() { kill "$(ps -e | fzf | awk '{ print $1 }')" 2>/dev/null; }

#broot setup
function br {
    f=$(mktemp)
    (
	set +e
	broot --outcmd "$f" "$@"
	code=$?
	if [ "$code" != 0 ]; then
	    rm -f "$f"
	    exit "$code"
	fi
    )
    code=$?
    if [ "$code" != 0 ]; then
	return "$code"
    fi
    d=$(<"$f")
    rm -f "$f"
    eval "$d"
}
