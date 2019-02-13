#
# ~/.bash_profile
#

##set/extend enviroment variables
export PATH=$HOME/.local/bin:$PATH
export EDITOR="vim"
export VISUAL=$EDITOR
export TERMINAL="urxvtc"
export TERMINAL2="lxterminal"
export BROWSER="qutebrowser"
if [ "$(cat /etc/hostname)" == "Mars" ];then
    export BROWSER2="iceweasel"
else
    export BROWSER2="firefox"
fi
export READER="zathura"
export READER2="evince"
export FILE="ranger"
export FILE2="nnn"
RANGER_LOAD_DEFAULT_RC=FALSE

[[ -f ~/.bashrc ]] && . ~/.bashrc

##start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
