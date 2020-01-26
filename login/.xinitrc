#! /bin/sh
###############################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2020-01-26 12:10]
#     Description         :     Start Xorg
###############################################################################

#set keyboard layout
if [ "$(hostname)" = "Mars" ];then
    setxkbmap gb
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

#you do not need a mouse
unclutter -idle 2 -jitter 50 -root &

#start Window Manager
exec dwm