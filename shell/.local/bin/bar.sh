#! /bin/sh
# File              : bar.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 27.04.2020
# Last Modified Date: 22.07.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#handle SIGTRAP signals to update the status bar
trap 'update' 5

#set the deliminter character
delim="|"

#set update time in s
time=10

#function that outputs the appearance of the statusbar
status() {

  echo "$delim"

  #get the volume with pulsemixer
  if [ "$(pulsemixer --get-mute)" = "1" ]; then
    echo "🔇"
  else
    pulsemixer --get-volume | awk '{print "🔊" $1}'
  fi
  echo "$delim"

  #show the cpu temperature
  sensors | awk '/CPU/ {print "🔥" $2}'
  echo "$delim"

  #show RAM usage
  free -h | awk '/^Mem:/ {print "💾" $3 "/" $2}'
  echo "$delim"

  #show remaining battery power
  if [ -d /sys/class/power_supply/BAT? ]; then
    acpi -b | awk '{print $3 $4 "("$5")"}' | sed -e 's/,//g; s/Charging/🔌/g; s/Full/⚡/g; s/Discharging/🔋/g; s/Notcharging/🔄/g'
  else
    echo "⛽"
  fi
  echo "$delim"

  #wifi quality percentage
  grep "^\s*w" /proc/net/wireless | awk '{ print "📶",int($3 * 100 / 70)"% " }'
  sed "s/down//;s/up/🌐/" /sys/class/net/e*/operstate
  echo "$delim"

  # Date and time.
  echo "📅"
  date '+%d/%m/%y (%a) %H:%M'
}

update() {
  xsetroot -name "$(status | tr -d '\n')" &
}

while :; do
  update
  sleep $time &
  wait
done

exit 0
