#!/bin/bash
# File              : convert.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 25.02.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

find . -type f -name "*.xopp" | parallel "xournalpp {/} -p {/.}.pdf"

exit 0
