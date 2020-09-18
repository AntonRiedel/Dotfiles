#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 18.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit

#choose a layout with dmenu
layout=$(ls $HOME/.config/screenlayout | dmenu -F -i -p "Where are you?")

#set the layout
$HOME/.config/screenlayout/$layout

#clean up
xwallpaper --stretch $WALLPAPER
setxkbmap us
setxkbmap -option caps:escape
xinput --map-to-output 'Wacom ISDv4 E6 Pen Pen (0)' LVDS1
thinkpad-touch off

exit 0
