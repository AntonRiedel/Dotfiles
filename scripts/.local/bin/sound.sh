#!/bin/sh
# File              : sound.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 07.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

[ -z "$2" ] && num="10" || num="$2"

case "$1" in
u*) pulsemixer --change-volume +"$num" ;;
d*) pulsemixer --change-volume -"$num" ;;
m*) pulsemixer --toggle-mute ;;
esac

#update statusbar by sending signal 5 to bar.sh; trap is handling the signal
pkill --signal 5 bar.sh

exit 0
