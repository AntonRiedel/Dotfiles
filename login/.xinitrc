#!/bin/sh
# File              : .xinitrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
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

#Set default desktop layout
$HOME/.config/screenlayout/default.sh

#Set default wallpaper
xwallpaper --stretch "$HOME/.config/wallpaper/default"

#activate statusbar
bar.sh &

#start compositor
xcompmgr &

#start notification daemon
dunst &

#set window manager agnostic keybindings
sxhkd &

#start screenshot utility
flameshot &

#you do not need a mouse
unclutter -idle 2 -jitter 50 -root &

#disable touchscreen and touchpad on X220
thinkpad-touch off
thinkpad-touchpad off

#start Window Manager
exec dwm
