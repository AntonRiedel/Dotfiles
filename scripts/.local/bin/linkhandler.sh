#!/bin/sh
# File              : linkhandler.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

if [[ -z "$1" ]]; then
    "$BROWSER"
    exit
fi

case "$1" in
*mkv | *webm | *mp4 | *youtube.com* | *youtu.be* | *hooktube.com* | *bitchute.com*)
    setsid mpv --input-ipc-server=/tmp/mpvsoc$(date +%s) -quiet "$1" >/dev/null 2>&1 &
    ;;
*png | *jpg | *jpe | *jpeg | *gif)
    if [[ -f "$1" ]]; then
        sxiv -a "$1" >/dev/null 2>&1 &
    else
        echo "$(echo "$1" | sed "s/.*\///")"
        curl -sL "$1" >"/tmp/$(echo "$1" | sed "s/.*\///")" && sxiv -a "/tmp/$(echo "$1" | sed "s/.*\///")" >/dev/null 2>&1 &
    fi
    ;;
*pdf)
    if [[ -f "$1" ]]; then
        $READER "$1" >/dev/null 2>&1 &
    else
        curl -sL "$1" >"/tmp/$(echo "$1" | sed "s/.*\///")" && $READER "/tmp/$(echo "$1" | sed "s/.*\///")" >/dev/null 2>&1 &
    fi
    ;;
*mp3 | *flac | *opus | *mp3?source*)
    setsid tsp curl -LO "$1" >/dev/null 2>&1 &
    ;;
*)
    if [[ -f "$1" ]]; then
        "$TERMINAL" -e "$EDITOR $1"
    else
        setsid "$BROWSER" "$1" >/dev/null 2>&1 &
    fi
    ;;
esac
