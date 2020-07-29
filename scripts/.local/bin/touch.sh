#!/bin/sh
# File              : touch.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 04.04.2020
# Last Modified Date: 07.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

if [ "$1" = "setup" ]; then
    flameshot &>/dev/null &
    gromit-mpx &>/dev/null &
    #easystroke --config-dir $HOME/.config/easystroke 2>/dev/null &
    #cellwriter --profile=$HOME/.config/cellwriter/profile --dock-window=2 --hide-window 2>/dev/null &
    #cellwriter --keyboard-only &
    notify-send -t 1500 "Touchscreen setup" "Start flameshot\nStart gromit-mpx"
    exit 0
elif [ "$1" = "reset" ]; then
    killall flameshot &>/dev/null
    killall gromit-mpx &>/dev/null

    #killall easystroke 2>/dev/null
    #killall cellwriter 2>/dev/null
    xsetroot -name "--RESET--"
    pkill --signal 5 bar.sh
    notify-send -t 1500 "Touchscreen reset" "Kill flameshot\nKill gromit-mpx"
    exit 0
else
    notify-send "touch.sh" "Invalid argument"
    exit 1
fi
