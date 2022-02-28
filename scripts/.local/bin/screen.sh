#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.02.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit 1

#choose a layout with dmenu
layout=$(find $HOME/.screenlayout -type f -name "*.sh" | xargs -I{} basename {} | dmenu -F -i -p "Where are you?")

#set the layout
$HOME/.screenlayout/$layout

#clean up
xset -dpms
xset s off
xset r rate 300 50
xwallpaper --stretch $WALLPAPER
xinput --map-to-output 'Wacom ISDv4 E6 Pen Pen (0)' LVDS1
thinkpad-touch off

exit 0
