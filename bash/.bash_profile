#
# ~/.bash_profile
#

##set/extend enviroment variables
export PATH=$HOME/.bin:$PATH
export EDITOR="vim"
export VISUAL=$EDITOR
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"
RANGER_LOAD_DEFAULT_RC=FALSE

[[ -f ~/.bashrc ]] && . ~/.bashrc

##start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
