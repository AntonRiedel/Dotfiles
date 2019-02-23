#! /bin/bash
#################################################################################
#     File Name           :     sound.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:46]
#     Last Modified       :     [2019-02-23 19:47]
#     Description         :     Audio interface (uses pulsemixer and i3)
#################################################################################

[ -z "$2" ] && num="2" || num="$2"

case "$1" in
u*) pulsemixer --change-volume +"$num" ;;
d*) pulsemixer --change-volume -"$num" ;;
m*) pulsemixer --toggle-mute ;;
truemute) pulsemixer --mute ;;
esac
pkill -RTMIN+10 i3blocks
