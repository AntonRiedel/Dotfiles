#!/bin/sh
# File              : baraction.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 20.04.2020
# Last Modified Date: 23.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
    echo "$vol"
}

battery(){
    [ -d /sys/class/power_supply/BAT? ] && acpi -b | awk '{print $3,$4,"("$5")"}' | sed -e 's/,//g' || echo "-"
}

mem() {
  mem=`free | awk '/Mem/ {printf "%dM/%dM\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo "$mem"
}

cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo "$cpu%"
}

cpu_temp(){
    sensors | awk '/Core 0/ {print $3}'
}

wifi(){
    grep "^\s*w" /proc/net/wireless | awk '{ print "📶",int($3 * 100 / 70)"%" }'; sed "s/down//;s/up/ETH/" /sys/class/net/e*/operstate
}

clock(){
    clock="$(date +%I:%M%p)"
    echo "$clock"
}

SLEEP_SEC=2

while :; do
    xsetroot -name "|🔈$(vol)|🔋$(battery)|💾$(mem)|💻$(cpu)|🔥$(cpu_temp)|$(wifi)|$(clock)"
	sleep $SLEEP_SEC
done
