#!/bin/sh

declare dir_pr=$(pwd) dir_0="/05";

if [[ $dir_pr == *"$dir_0" ]] ;
then
  start_time=$(date +%s.%N);
  . ../02/var.sh
  get_dir="${@}"
  if test -d "${get_dir}" ;
  then 
    # Get DIR
    get_dir="${@}"
  else
    echo "Warning: path doesn't exist. Set default path!"
    get_dir="./"
  fi
    . var05.sh
    . echo05.sh
else
    echo "Error: Please run script from *src$dir_0/ directory!"
    exit 1
fi
