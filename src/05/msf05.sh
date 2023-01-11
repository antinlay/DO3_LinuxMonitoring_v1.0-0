#!/bin/sh

# du -h "${get_dir}" | sort -rh | head -n 6 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 0 | awk '{printf ("%d - %s %s,\t%0.0f %sB\n", $1, $4, $5, $2, $3)}' | tail -n +2

# Initialize an array to store the sizes and hashes of the executable files
declare -A sizes units set_nums path_arr
declare -i i=0

# Count of result = 5 + 1 because first folder is total
count=6;
for (( i=1; i < $count; i++ ));
do
  # echo "${get_dir}" "OK";
  path=$(du -h -d 1 "${get_dir}" | sort -rh | head -n ${count} | tail -n +2 | sed -E 's/^([0-9]+[,.0-9]+)([[KMGTkmgt])\t(.*)/\3/' | sed -n "${i}p");
  # echo "${path}" "!!";
  size=$(du -h -d 0 "${path}" | awk '{print $1}' | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2/g' | cut -d' ' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(du -h -d 0 "${path}" | awk '{print $1}' | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2B/g' | cut -d' ' -f2);
  set_num="${i} -";
  echo $(printf "%s %s %s %s\n" "${set_num}" "${path}"/, "${size}" "${unit}");
done