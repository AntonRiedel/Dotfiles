#! /bin/sh
###############################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2020-03-08 23:38]
#     Description         :     Start Xorg
###############################################################################

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

#disable touchscreen and touchpad
thinkpad-touch off
thinkpad-touchpad off
#start Window Manager
exec dwm
