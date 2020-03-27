#!/bin/sh
# File              : convert.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

for item in ${PWD}/*.xopp
do
    echo "Convert $item"
    xournalpp $item --create-pdf ${item/%xopp/pdf}
done