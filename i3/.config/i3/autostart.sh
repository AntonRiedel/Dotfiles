#! /bin/bash
###############################################################################
#     File Name           :     autostart.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-04-01 14:16]
#     Last Modified       :     [2019-04-01 14:22]
#     Description         :     Autostart script for i3
###############################################################################

#Set default desktop layout
$HOME/.screenlayout/Standard.sh
#Set default wallpaper
nitrogen --restore
#start background applications
compton &
dunst &
unclutter --jitter 20 --ignore-scrolling &
if [ "$(hostname)"=="Atlas" ]; then
    conky &
fi
