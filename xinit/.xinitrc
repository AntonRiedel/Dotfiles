#! /bin/bash
###############################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2019-05-19 14:46]
#     Description         :     Start Xorg
###############################################################################

#set keyboard layout
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
xwallpaper --maximize $HOME/.config/i3/wallpaper/default

#start compositor
compton &

#start notification daemon
dunst &

#set window manager agnostic keybindings
sxhkd &

#you do not need a mouse
unclutter --jitter 20 --ignore-scrolling &

#start Window Manager
exec i3
