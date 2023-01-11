# #!/bin/bash

# Initialize an array to store the sizes and hashes of the executable files
declare -A sizes hashes units set_nums files
declare -i i=0

# Count of result
count=10;

# Get a list of all executable files in the current directory and its subdirectories
files=$(find "${@}" -type f -executable -printf "%h/%f %s\n" | sort -hr -k2 | cut -d' ' -f1 | head -n $count);

# Calculate the size and hash of each executable file
for file in ${files};
do
  i=$i+1;
  size=$(ls -sh "$file" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2/g' | cut -d' ' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(ls -sh "$file" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2B/g' | cut -d' ' -f2);
  hash=$(md5sum "$file" | cut -d' ' -f1);
  set_num="${i} -";
  sizes[$i]=$size;
  hashes[$i]=$hash;
  units[$i]=$unit;
  set_nums[$i]=$set_num;
  files[$i]=$file;
done
# Use count
count=$i;
# Output in need format
for (( i=1; i <= $count; i++ ));
do
  echo $(printf "%s %s %s %s %s\n" "${set_nums[$i]}" "${files[$i]}", "${sizes[$i]}" "${units[$i]}", "${hashes[$i]}") 
done
