#!/bin/sh
# File              : touch.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 04.04.2020
# Last Modified Date: 08.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

if [ "$1" = "setup" ]; then
    flameshot 2>/dev/null &
    easystroke --config-dir $HOME/.config/easystroke 2>/dev/null &
    cellwriter --profile=$HOME/.config/cellwriter/profile --dock-window=2 --hide-window 2>/dev/null &
    notify-send "Touchscreen setup" "Start flameshot\nStart easystroke\nStart cellwriter"
elif [ "$1" = "reset" ];then
    killall flameshot 2>/dev/null
    killall easystroke 2>/dev/null
    killall cellwriter 2>/dev/null
    xsetroot -name "--RESET--"
    notify-send "Touchscreen reset" "Kill flameshot\nKill easystroke\nKill cellwriter"
else
    notify-send "touch.sh" "Invalid argument"
fi

