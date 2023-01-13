#!/bin/bash

# Initialize an array to store the sizes and hashes of the executable files
declare -A sizes units set_nums path_arr;
declare -i i=0 count=6;

# Get count
if [[ $num_folders -lt $count ]];
then
  count=$num_folders;
fi

for (( i=1; i < $count; i++ ));
do
  path=$(du -h "${1}" | sort -rh | head -n ${count} | tail -n +2 | sed -E 's/^([0-9]+[,.0-9]+)([[KMGTkmgt])\t(.*)/\3/' | sed -n "${i}p");
  size=$(du -h -d 0 "${path}" | awk '{print $1}' | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2/g' | cut -d' ' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(du -h -d 0 "${path}" | awk '{print $1}' | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2B/g' | cut -d' ' -f2);
  set_num="${i} -";
  echo $(printf "%s %s %s %s\n" "${set_num}" "${path}"/, "${size}" "${unit}");
done
