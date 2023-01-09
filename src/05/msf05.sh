#!/bin/sh

# du -h "${get_dir}" | sort -rh | head -n 6 | sed 's/\([0-9]\)\([KMGBTb]\)/\1 \2/g' | nl -v 0 | awk '{printf ("%d - %s %s,\t%0.0f %sB\n", $1, $4, $5, $2, $3)}' | tail -n +2

# Initialize an array to store the sizes and hashes of the executable files
declare -A sizes units set_nums path_arr
declare -i i=0

# Count of result = 5 + 1 because first folder is total
count=6;

path_arr=$(du -h "${get_dir}" | sort -rh | head -n ${count} | tail -n +2 | awk '{print $2}');

# echo "${path_arr}";
# Calculate the size and hash of each executable file
for path in ${path_arr};
do
  i=$i+1;
  size=$(du -h -d 0 "${path}" | awk '{print $1}' | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2/g' | cut -d' ' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(du -h -d 0 "${path}" | awk '{print $1}' | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2B/g' | cut -d' ' -f2);
  set_num="${i} -";
  sizes[$i]=$size;
  units[$i]=$unit;
  set_nums[$i]=$set_num;
  path_arr[$i]=$path;
done
# Use count
count=$i;
# Output in need format
for (( i=1; i <= $count; i++ )); do
  echo $(printf "%s %s %s %s\n" "${set_nums[$i]}" "${path_arr[$i]}"/, "${sizes[$i]}" "${units[$i]}") 
done