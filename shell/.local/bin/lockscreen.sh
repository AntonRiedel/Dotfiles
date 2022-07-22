#!/bin/sh
# File              : lockscreen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 13.10.2020
# Last Modified Date: 28.02.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#take a screenshot of the entire desktop (with imagemagick)
import -window root /tmp/screen.png

#blur and swirl the picture
convert /tmp/screen.png -blur 0x8 -swirl 120 /tmp/locked.png

#lock the screen
i3lock -i /tmp/locked.png

#clean up afterwards
rm /tmp/locked.png /tmp/screen.png

exit 0
