#!/bin/bash

du -h $get_dir | sort -rh | head -n 5 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 1 | awk '{printf ("%d - %s, %0.0f %sB\n", $1, $4, $2, $3)}'
