# #!/bin/bash

# Initialize an array to store the sizes and hashes of the executable files
declare -A sizes hashes units set_nums files;
declare -i i count=10;

# Get count
if [[ $exe_files -lt $count ]];
then
  count=$exe_files;
fi

for (( i=1; i <= $count; i++ ));
do
  file=$(find "${1}" -type f -executable -printf "%s %h/%f\n" | sort -hr | head -n ${count} | sed 's/^[0-9]* //' | sed -n "${i}p");
  size=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2/g' | cut -d' ' -f1 | awk '{ printf ("%.0f", $1) }');
  unit=$(ls -sh "${file}" | cut -d' ' -f1 | sed 's/\([0-9]\)\([KMGTkmgt]\)/\1 \2B/g' | cut -d' ' -f2);
  hash=$(md5sum "${file}" | cut -d' ' -f1);
  set_num="${i} -";
  echo $(printf "%s %s %s %s %s\n" "${set_num}" "${file}", "${size}" "${unit}", "${hash}") ;
done
