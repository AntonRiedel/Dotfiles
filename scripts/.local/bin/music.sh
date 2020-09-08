#!/bin/bash
# File              : music.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 08.06.2020
# Last Modified Date: 16.06.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#check for arguments
[ -z $1 ] && echo "File with meta data missing" && exit 1
[ -z $2 ] && echo "File with tracklist missing" && exit 1

#extract meta data
Url="$(sed -n '1p' <$1)"
[ -z "$Url" ] && echo "Url is empty" && exit 1
echo "$Url"

Band="$(sed -n '2p' <$1)"
[ -z "$Band" ] && echo "Band is empty" && exit 1
echo "$Band"

Album="$(sed -n '3p' <$1)"
[ -z "$Album" ] && echo "Album is empty" && exit 1
echo "$Album"

Year="$(sed -n '4p' <$1)"
[ -z "$Year" ] && echo "Year is empty" && exit 1
echo "$Year"

#make album name safe and create a directory
Dir="$(echo "$Album" | iconv -cf UTF-8 -t ASCII//TRANSLIT | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed "s/-\+/-/g;s/\(^-\|-\$\)//g")"
[ ! -d "$Dir" ] && mkdir "$Dir" || echo "$Dir exists; something smells fishy"

#set the total number of tracks
Total="$(wc -l <"$2")"

#download data
youtube-dl -i -x -f best/bestaudio -o '%(playlist_index)02d.%(ext)s' "$Url"

#set counter for tracks
Counter=1

while read Song; do

    Match="$(printf "%.2d" "$Counter")"

    echo "Number: $Match"
    echo "Song: $Song"

    #find the corresponding file
    File="$(basename "$(find . -maxdepth 1 -iname "${Match}*")")"
    echo "$File"

    #check if we find file, give a warning if not
    #[ -z "$File" ] && echo "Someting is wrong, "$File" not found" && continue

    #if the file is not .opus, convert it and remove the original
    [[ ! "$File" =~ "opus" ]] && ffmpeg -nostdin -y -i "$File" "${File/.*/.opus}" && rm "$File" && File="${File/.*/.opus}"
    echo "$File"

    #create a save title for the file of the song
    Title="$(echo "$Song" | iconv -cf UTF-8 -t ASCII//TRANSLIT | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed "s/-\+/-/g;s/\(^-\|-\$\)//g")"

    #tag the file with meta data
    echo "Tagging \"$Song\"..." && tag.sh -a "$Band" -A "$Album" -t "$Song" -n "$Counter" -N "$Total" -d "$Year" "$File"

    mv "$File" "$Dir/${Match}_${Title}.opus"

    ((Counter += 1))

done <$2

exit 0
