###############################################################################
#     File Name           :     environment.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-03-12 16:42]
#     Last Modified       :     [2019-04-02 17:37]
#     Description         :     Environment variables for the shell
###############################################################################

#set environment variables
export PATH=$HOME/.local/bin:$PATH

export TERMINAL="/usr/bin/termite"
export TERMINAL2="/usr/bin/lxterminal"

export EDITOR="/usr/bin/nvim"
export VISUAL=$EDITOR
export MYVIMRC=$HOME/.config/nvim/init.vim
export MYVIMCONFIG=$HOME/.config/nvim/config

#~/.local/bin/vifm is a custom script to launch vifm with image preview
#it will be started instead of /usr/bin/vifm since it appears first in PATH
export FILE="$HOME/.local/bin/vifm"

if [ "$(hostname)" == "Mars" ]; then
    export BROWSER="/usr/bin/iceweasel"
else
    export BROWSER="/usr/bin/firefox"
fi
export BROWSER2="vimb"

#reader for pdf files
export READER="/usr/bin/zathura"
export READER2="/usr/bin/evince"

#default options for fzf
export FZF_DEFAULT_OPTS="--reverse --height=40%"
