#!/bin/sh
#Session settings for Munich

#Configure screens
xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --off --output DP1 --off --output TV1 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --primary --mode 1280x800 --pos 1920x280 --rotate normal --output VGA1 --mode 1920x1080 --pos 0x0 --rotate normal

#restore background
nitrogen --restore
