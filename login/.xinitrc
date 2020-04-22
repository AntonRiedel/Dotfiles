#!/bin/sh
# File              : .xinitrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 20.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#set keyboard layout
if [ "$(hostname)" = "Mars" ];then
    setxkbmap gb
elif [ "$(hostname)" = "Moon" ];then
    setxkbmap de
else
    setxkbmap us
fi

#make capslock useful
setxkbmap -option caps:escape

#prevent screen from blanking
xset -dpms
xset s off

#set default screen setup
$HOME/.config/screenlayout/default.sh

#set default wallpaper
xwallpaper --stretch "$HOME/.config/wallpaper/default"

#start compositor
xcompmgr &

#start notification daemon
dunst &

#set window manager agnostic keybindings
sxhkd &

#disable touchscreen and touchpad on X220 (meaning only pen and trackpoint work)
thinkpad-touch off
#thinkpad-touchpad off

#you do not need a mouse
unclutter --timeout 2 --jitter 100 --ignore-scrolling &

#launch statusbar
baraction.sh &

#start Window Manager
exec dwm
