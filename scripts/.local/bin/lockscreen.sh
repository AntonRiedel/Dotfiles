#!/bin/sh
# File              : lockscreen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 26.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

rm -f /tmp/*.png

# If `imagemagick` is not installed, use a blank screen.
[ -f /usr/bin/convert ] &&
    scrot -m -z  /tmp/screen.png &&
    convert /tmp/screen.png -blur 0x8 -swirl 120 /tmp/locked.png

i3lock -e -f -c 000000 -i /tmp/locked.png

rm -f /tmp/locked.png
