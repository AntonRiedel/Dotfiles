#! /bin/bash
###############################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2019-05-19 14:21]
#     Description         :     Start Xorg
###############################################################################

#set keyboard
if [ "$(hostname)" == "Mars" ];then
    setxkbmap gb
else
    setxkbmap de
fi

#make capslock useful
setxkbmap -option caps:escape

#prevent screen from blanking
xset -dpms
xset s off

#Set default desktop layout
$HOME/.screenlayout/Standard.sh
#Set default wallpaper
nitrogen --restore
#start background applications
compton &
dunst &
unclutter --jitter 20 --ignore-scrolling &

#start Window Manager
exec i3
