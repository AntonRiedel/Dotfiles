#! /bin/sh
###############################################################################
#     File Name           :     autostart.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-05-20 18:16]
#     Last Modified       :     [2019-05-21 10:00]
#     Description         :     DWM autostart script (for status configuration)
###############################################################################

mydate() {
    date '+%Y %b %d (%a) %I:%M%p'
}

battery() {
    if [ -d /sys/class/power_supply/BAT0 ]; then
        acpi -b | awk '{print $3,$4,$5}' | sed -e 's/,//g'
    else
        echo "NO BAT"
    fi
}

cpu() {
    sensors | awk '/Core 0/ {print $3}'
}

memory() {
    free -h | awk '/^Mem:/ {print $3 "/" $2}'
}

sound() {
    if [ "$(pulsemixer --get-mute)" = "1" ]; then
        echo "MUTE"
    else
        pulsemixer --get-volume | awk '{print $1}'
    fi
}

mail() {
    du -a ~/.local/share/mail/*/INBOX/new/* 2>/dev/null | sed -n '$='
}

while true; do
    xsetroot -name "MAIL:$(mail)|MEM:$(memory)|TEMP:$(cpu)|VOL:$(sound)|BAT:$(battery)|TIME:$(mydate)"
    sleep 5s
done
