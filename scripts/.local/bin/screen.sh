#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 18.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit

layout=$(ls $HOME/.config/screenlayout | dmenu -F -i -p "Where are you?")

$HOME/.config/screenlayout/$layout

xwallpaper --stretch $HOME/nextcloud/wallpaper/default

#clean up
setxkbmap us
setxkbmap -option caps:escape
xinput --map-to-output 'Wacom ISDv4 E6 Pen Pen (0)' LVDS1

exit 0
