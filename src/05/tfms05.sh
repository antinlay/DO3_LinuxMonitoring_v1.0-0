#!/bin/sh

# find "${get_dir}" -type f -printf '%f\n' -exec du -h {} + | sort -rh | head -n 10 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 1 | awk '{printf ("%d - %s, %.0f %sB,\n", $1, $4, $2, $3)}' | sed -E 's|^(.*/)([^/.]*)(\.[^/.]*)?$|\1\2\3 \3|' | sed 's/, *[0-9]\+ [KMGBTb][KMGBTb], *$//'

# Initialize an array to store the sizes and hashes of the files
declare -A sizes extens units set_nums files
declare -i i=0 count=0
# Count of result
count=10;
none="none";
# files=$(find "${get_dir}" -type f -printf "%h/%f %s\n" | sort -rh -k2 | head -n "${count}" | cut -d' ' -f1);

# for file in ${files};
# do
#     i=$i+1;
#     size=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1_\2/' | cut -d'_' -f1 | awk '{ printf ("%.0f", $1) }');
#     unit=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1_\2B/' | cut -d'_' -f2);
#     exten=$(find "${file}" -type f -printf "%f\n" | sed -E 's|([^.]*)(\.[^.]*)?$|\2|' | sed 's/.*\.//g');
#     set_num="${i} -";
#     sizes[$i]=$size;
#     extens[$i]=${exten:-$none};
#     units[$i]=$unit;
#     set_nums[$i]=$set_num;
#     files[$i]=$file;
# done
# # Use count
# count=$i;
# Output in need format
for (( i=1; i <= $count; i++ )); do
  file=$(find "${get_dir}" -type f -printf "%s %h/%f\n" | sort -hr | head -n ${count} | sed 's/^[0-9]* //' | sed -n "${i}p");
  size=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1_\2/' | cut -d'_' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1_\2B/' | cut -d'_' -f2);
  exten=$(find "${file}" -type f -printf "%f\n" | sed -E 's/([^.]*)(\.[^.]*)?$/\2/' | sed 's/.*\.//g');
  set_num="${i} -";
  echo $(printf "%s %s %s %s %s\n" "${set_num}" "${file}", "${size}" "${unit}", "${exten:-$none}") 
done