#!/bin/sh
# File              : lockscreen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 13.10.2020
# Last Modified Date: 13.10.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#clean up
rm -f /tmp/flameshot*png

#take a screenshot of the entire desktop and save it under /tmp
#it will be called 'flameshot-someNumbers.png'
flameshot full -p /tmp

sleep 1

find /tmp -type f -name "flameshot*png" -exec mv {} /tmp/screen.png \;

convert /tmp/screen.png -blur 0x8 -swirl 120 /tmp/locked.png

i3lock -i /tmp/locked.png

rm /tmp/locked.png /tmp/screen.png

exit 0
