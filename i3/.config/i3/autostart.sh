#! /bin/bash
###############################################################################
#     File Name           :     autostart.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-04-01 14:16]
#     Last Modified       :     [2019-05-19 14:25]
#     Description         :     Autostart script for i3
###############################################################################

#Set default desktop layout
$HOME/.screenlayout/Standard.sh
#Set default wallpaper
nitrogen --restore
#compositor
compton &
#notification daemon
dunst &
#mouse is unnecessary
unclutter --jitter 20 --ignore-scrolling &
#window manager agnostic keybindings
sxhkd &

#conky
if [ "$(hostname)" == "Atlas" ]; then
    conky &
fi
