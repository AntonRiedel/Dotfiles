###############################################################################
#     File Name           :     .bash_profile
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:41]
#     Last Modified       :     [2019-02-27 19:11]
#     Description         :     bash_profile
###############################################################################

##set/extend enviroment variables
export PATH=$HOME/.local/bin:$PATH
export EDITOR="nvim"
export VISUAL=$EDITOR
export MYVIMRC=~/.config/nvim/init.vim
export MYVIMCONFIG=~/.config/nvim/config
export TERMINAL="xfce4-terminal"
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

##source bashrc
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

##start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
