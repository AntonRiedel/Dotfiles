#! /bin/sh
###############################################################################
#     File Name           :     autostart.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-05-20 18:16]
#     Last Modified       :     [2019-06-19 10:36]
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
        echo ""
    else
        pulsemixer --get-volume | awk '{print " " $1}'
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
        acpi -b | awk '{print $3,$4,$5}' | sed -e 's/,//g;;s/Discharging/🔋/;s/Not Charging/🛑/;s/Charging/🔌/;s/Unknown/♻️/;s/Full/⚡/g'
    else
        echo "NO BAT"
    fi
    echo "$delim"

    # Wifi quality percentage and  icon if ethernet is connected.
	grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70) "%" }'
	sed "s/down//;s/up//" /sys/class/net/e*/operstate
    echo "$delim"

	# Date and time.
	date '+%Y %b %d (%a) %I:%M%p'
	}

update() {
	# So all that big status function was just a command that quicking gets
	# what we want to be the statusbar. This xsetroot command is what sets
	# it. Note that the tr command replaces newlines with spaces. This is
	# to prevent some weird issues that cause significant slowing of
	# everything in dwm. Note entirely sure of the cause, but again, the tr
	# command easily avoids it.
	xsetroot -name "$(status | tr '\n' ' ')" &
    }

while :; do
    update
	# Sleep for a minute after changing the status bar before updating it
	# again. We run sleep in the background and use wait until it finishes,
    # because traps can interrupt wait immediately, but they can't do that
    # with sleep.
	sleep 1m &
    wait
done
