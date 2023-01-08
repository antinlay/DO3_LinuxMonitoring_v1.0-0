#!/bin/sh

find "${get_dir}" -type f -printf '%f\n' -exec du -h {} + | sort -rh | head -n 10 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 1 | awk '{printf ("%d - %s, %.0f %sB, %s\n", $1, $4, $2, $3, $4)}' | sed 's/\/[^.]*\.//' 