#!/bin/sh

du -h "${get_dir}" | sort -rh | head -n 6 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 0 | awk '{printf ("%d - %s %s,\t%0.0f %sB\n", $1, $4, $5, $2, $3)}' | tail -n +2
