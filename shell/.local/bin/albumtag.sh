#!/bin/sh
# File              : albumtag.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 30.05.2020
# Last Modified Date: 30.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

[ -z $1 ] && echo "Need a download link to an album" && exit 1

#get current directory
dir=$PWD

echo "Enter the album/book title:"; read -r booktitle

echo "Enter the artist/author:"; read -r author

echo "Enter the publication year:"; read -r year

escbook="$(echo "$booktitle" | iconv -cf UTF-8 -t ASCII//TRANSLIT | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed "s/-\+/-/g;s/\(^-\|-\$\)//g")"

#create a directory to dump the files
mkdir $escbook

#youtube-dl -x -f bestaudio/best --yes-playlist $1

exit 0
