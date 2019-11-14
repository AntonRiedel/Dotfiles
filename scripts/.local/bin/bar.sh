#! /bin/sh
###############################################################################
#     File Name           :     autostart.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-05-20 18:16]
#     Last Modified       :     [2019-08-09 20:43]
#     Description         :     DWM autostart script (for status configuration)
###############################################################################

# Handle SIGTRAP signals sent by refbar to update the status bar immediately.
trap 'update' 5

# Set the deliminter character.
delim="|"

# Function that outputs the appearance of the statusbar.
status() {

	echo "$delim"

	# Get the volume with pulsemixer
    if [ "$(pulsemixer --get-mute)" = "1" ]; then
        echo "MUTE"
    else
        pulsemixer --get-volume | awk '{print "VOL:" $1}'
    fi
	echo "$delim"

    # Show the cpu temperature
    sensors | awk '/Core 0/ {print $3}'
	echo "$delim"

    # Show RAM usage
    free -h | awk '/^Mem:/ {print $3 "/" $2}'
	# Will show remaining battery power
	echo "$delim"

    if [ -d /sys/class/power_supply/BAT? ]; then
        acpi -b | awk '{print $3,$4,"("$5")"}' | sed -e 's/,//g'
    else
        echo "NO BAT"
    fi
    echo "$delim"

    # Wifi quality percentage and  icon if ethernet is connected.
	grep "^\s*w" /proc/net/wireless | awk '{ print "WIFI",int($3 * 100 / 70)"%" }'
	sed "s/down//;s/up/ETH/" /sys/class/net/e*/operstate
    echo "$delim"

	# Date and time.
	date '+%Y %b %d (%a) %I:%M%p'
	}

update() {
	xsetroot -name "$(status | tr '\n' ' ')" &
    }

while :; do
    update
	sleep 1m &
    wait
done
