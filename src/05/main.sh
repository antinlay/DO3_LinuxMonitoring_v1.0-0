#!/bin/sh

declare dir_pr=$(pwd) dir_0="/05" get_dir="${@}" start_time=$(date +%s.%N);

if [[ $dir_pr == *"$dir_0" ]] ;
then
  if test -d "${get_dir}";
  then 
    # Get DIR
    get_dir="${@}"
  else
    echo "Warning: path doesn't exist. Default ./ directory."
    get_dir="./"
  fi
    . var05.sh
    . echo05.sh
else
    echo "Error: Please run script from *src$dir_0/ directory!"
    exit 1
fi
