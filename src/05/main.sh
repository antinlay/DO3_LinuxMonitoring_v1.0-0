#!/bin/sh

start_time=$(date +%s.%N);
dir_pr=$(pwd)
dir_0="/05"

if [[ $dir_pr == *"$dir_0" ]] ;
then
  . ../02/var.sh
  get_dir="${@}"
  if test -d "$get_dir" ;
  then 
    # Get DIR
    get_dir="${@}"
  else
    echo "Warning: path doesn't exist. Set default path!"
    get_dir="$HOME"
  fi
    # Total number of folders, including subfolders
    num_folders=$(du "${get_dir}" | wc -l);
    echo "Total number of folders (including all nested ones) = $num_folders"

    # Top 5 folders with largest size in descending order (path and size)
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):";
    . msf05.sh;
    # Total number of files
    num_files=$(find "${get_dir}" -type f | wc -l);
    echo "Total number of files = $num_files";
    # Number of configuration files (with .conf extension), text files, executable files, log files (files with .log extension), archives, symbolic links
    exe_files=$(find "${get_dir}" -type f -executable | wc -l);
    conf_files=$(find "${get_dir}" -type f -name "*.conf" | wc -l);
    text_files=$(find "${get_dir}" -type f -name "*.txt" | wc -l);
    log_files=$(find "${get_dir}" -type f -name "*.log" | wc -l);
    arch_files=$(find "${get_dir}" -type f -name "*.zip" -or -name "*.tz" -or -name "*.tar" -or -name "*.shar" -or -name "*.7z -or -name "*.rar""| wc -l);
    symb_files=$(find "${get_dir}" -type l | wc -l);
    echo "Configuration files (with the .conf extension) = $conf_files";
    echo "Text files = $text_files";
    echo "Executable files = $exe_files";
    echo "Log files (with the extension .log) = $arch_files";
    echo "Archive files = $arch_files";
    echo "Symbolic links = $symb_files";
    # Top 10 files with largest size in descending order (path, size and type)
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    . tfms05.sh
else
    echo "Error: Please run script from *src$dir_0/ directory!"
    exit 1
fi