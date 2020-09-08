#!/bin/sh
# File              : .xinitrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 27.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#set keyboard layout
if [ "$(hostname)" = "Mars" ]; then
    setxkbmap gb
elif [ "$(hostname)" = "Moon" ]; then
    setxkbmap de
else
    setxkbmap us
fi

#capslock: useless key in a great location; let's make it great
setxkbmap -option caps:escape

#prevent screen from blanking
xset -dpms
xset s off

#change your life
xset r rate 300 50

#set default screenlayout
$HOME/.config/screenlayout/default.sh

#set default wallpaper
xwallpaper --stretch $WALLPAPER

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
bar.sh &

#start Window Manager
exec dwm
