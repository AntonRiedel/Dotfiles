#
# ~/.bash_profile
#

##set/extend enviroment variables
export PATH=$HOME/.local/bin:$HOME/.bin:$PATH
export EDITOR="vim"
export VISUAL=$EDITOR
export TERMINAL="st"
export TERMINAL2="lxterminal"
export BROWSER="qutebrowser"
export BROWSER2="falkon"
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
