#! /bin/bash
#################################################################################
#     File Name           :     linkhandler.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-25 18:28]
#     Last Modified       :     [2019-02-25 21:07]
#     Description         :     Feed script a url or file location.
#								If an image, it will view in sxiv,
#								if a video or gif, it will view in mpv
#								if a music file or pdf, it will download,
#								otherwise it opens link in browser.
#################################################################################

if [[ ! -f "$1" ]]; then
    if [[ -z "$1" ]]; then
        foo=$(cat)
    else
        foo="$1"
    fi
else
    foo="$1"
fi

echo $foo

case "$foo" in
*mkv | *webm | *mp4 | *youtube.com* | *youtu.be* | *hooktube.com* | *bitchute.com*)
    setsid mpv --input-ipc-server=/tmp/mpvsoc$(date +%s) -quiet "$foo" >/dev/null 2>&1 &
    ;;
*png | *jpg | *jpe | *jpeg | *gif)
    if [[ -f "$foo" ]]; then
        sxiv -a "$foo" >/dev/null 2>&1 &
    else
        echo "$(echo "$foo" | sed "s/.*\///")"
        curl -sL "$foo" >"/tmp/$(echo "$foo" | sed "s/.*\///")" && sxiv -a "/tmp/$(echo "$foo" | sed "s/.*\///")" >/dev/null 2>&1 &
    fi
    ;;
*pdf)
    if [[ -f "$foo" ]]; then
        $READER "$foo" >/dev/null 2>&1 &
    else
        curl -sL "$foo" >"/tmp/$(echo "$foo" | sed "s/.*\///")" && $READER "/tmp/$(echo "$foo" | sed "s/.*\///")" >/dev/null 2>&1 &
    fi
    ;;
*mp3 | *flac | *opus | *mp3?source*)
    setsid tsp curl -LO "$foo" >/dev/null 2>&1 &
    ;;
*)
    if [[ -f "$foo" ]]; then
        "$TERMINAL" -e "$EDITOR $foo"
    else
        setsid "$BROWSER" "$foo" >/dev/null 2>&1 &
    fi
    ;;
esac
