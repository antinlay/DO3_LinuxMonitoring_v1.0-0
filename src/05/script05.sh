#!/bin/bash

# Total number of folders, including subfolders
echo "Total number of folders (including all nested ones) = $num_folders"
if  [[ $num_folders -gt 1 ]];
then
    # Top 5 folders with largest size in descending order (path and size)
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):";
    . msf05.sh;
fi
. echo05.sh;
if  [[ $num_files -gt 0 ]];
then
    # Top 10 files with largest size in descending order (path, size and type)
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):";
    . tfms05.sh;
fi
if  [[ $exe_files -gt 0 ]];
then
    # TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) 
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    . ttef05.sh;
fi
. time.sh;
