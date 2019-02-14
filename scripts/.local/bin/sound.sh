#!/bin/sh
# A general audio interface

[ -z "$2" ] && num="2" || num="$2"

case "$1" in
u*) pulsemixer --change-volume +"$num" ;;
d*) pulsemixer --change-volume -"$num" ;;
m*) pulsemixer --toggle-mute ;;
truemute) pulsemixer --mute ;;
esac
pkill -RTMIN+10 i3blocks
