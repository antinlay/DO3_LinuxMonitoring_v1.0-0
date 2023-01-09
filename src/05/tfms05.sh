#!/bin/sh

# find "${get_dir}" -type f -printf '%f\n' -exec du -h {} + | sort -rh | head -n 10 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 1 | awk '{printf ("%d - %s, %.0f %sB,\n", $1, $4, $2, $3)}' | sed -E 's|^(.*/)([^/.]*)(\.[^/.]*)?$|\1\2\3 \3|' | sed 's/, *[0-9]\+ [KMGBTb][KMGBTb], *$//'

# Initialize an array to store the sizes and hashes of the files
declare -A sizes extens units set_nums files
declare -i i=0 count=0
# Count of result
count=10;

files=$(find "${get_dir}" -type f -printf "%h/%f %s\n" | sort -rh -k2 | head -n 10 | cut -d' ' -f1);

for file in ${files};
do
    i=$i++;
    size=$(ls -h "${files}")
done