#!/bin/bash

# Initialize an array to store the sizes and hashes of the files
declare -A sizes extens units set_nums files;
declare -i i=0 count=10;
declare none="none";

# Get count
if [[ $num_files -lt $count ]];
then
  count=$num_files;
fi

# Output in need format
for (( i=1; i <= $count; i++ )); do
  file=$(find "${1}" -type f -printf "%s %h/%f\n" | sort -hr | head -n ${count} | sed 's/^[0-9]* //' | sed -n "${i}p");
  size=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1_\2/' | cut -d'_' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1_\2B/' | cut -d'_' -f2);
  exten=$(find "${file}" -type f -printf "%f\n" | sed -E 's/([^.]*)(\.[^.]*)?$/\2/' | sed 's/.*\.//g');
  set_num="${i} -";
  echo $(printf "%s %s %s %s %s\n" "${set_num}" "${file}", "${size}" "${unit}", "${exten:-$none}");
done