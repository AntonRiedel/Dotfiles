#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 19.05.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit 1

#choose a layout with dmenu
layout=$(ls $HOME/.config/screenlayout | dmenu -F -i -p "Where are you?")

#set the layout
$HOME/.config/screenlayout/$layout

#clean up
setxkbmap -option ctrl:nocaps #map capslock to CRTL
xcape -e 'Control_L=Escape'   #map CRTL to escape when pressed on its own
xset -dpms
xset s off
xset r rate 300 50
xwallpaper --stretch $WALLPAPER
setxkbmap us
setxkbmap -option caps:escape
xinput --map-to-output 'Wacom ISDv4 E6 Pen Pen (0)' LVDS1
thinkpad-touch off

exit 0
