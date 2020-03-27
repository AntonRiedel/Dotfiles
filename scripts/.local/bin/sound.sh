#!/bin/sh
# File              : sound.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 27.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

[ -z "$2" ] && num="10" || num="$2"

case "$1" in
u*) pulsemixer --change-volume +"$num" ;;
d*) pulsemixer --change-volume -"$num" ;;
m*) pulsemixer --toggle-mute ;;
esac

#update statusbar by sending signal 10 do dwmblocks
pkill -RTMIN+10 dwmblocks
