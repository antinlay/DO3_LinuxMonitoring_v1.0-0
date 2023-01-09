#!/bin/bash

# find all executable files in the current directory and its subdirectories
find "${get_dir}" -type f -executable -exec stat -c '%n %s %F' {} \; | sort -k2,2nr | head -n 10 | while read line; do
  # extract the path, size, and file type from the output of stat
  path=$(echo $line | awk '{print $1}')
  size=$(echo $line | awk '{print $2}')
  file_type=$(echo $line | awk '{print $3}')

  # check if the file is an executable
  if [ "$file_type" == "regular file" ]; then
    # get the MD5 hash of the file
    md5=$(md5sum $path | awk '{print $1}')

    # print the file's path, size, and MD5 hash
    printf "%-10s %-10s %s\n" "$path" "$size" "$md5"
  fi
done
