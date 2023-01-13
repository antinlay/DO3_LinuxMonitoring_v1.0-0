#!/bin/bash

declare dir_pr=$(pwd) dir_0="/05" start_time=$(date +%s.%N);

if [[ $dir_pr == *"$dir_0" ]];
then
  if [[ $# -gt 1 ]];
  then
      echo "Error: Please run script with single parameter.";
      exit 1;
  fi
  if [[ "${1}" != */ ]];
  then
      echo "Error: Please atention parameter must end with '/'.";
      exit 1;
  fi
  if test -d "${1}";
  then 
    . var05.sh;
    . script05.sh;
  else
    echo "Error: path doesn't exist.";
    exit 1;
  fi
else
    echo "Error: Please run script from *src$dir_0/ directory!";
    exit 1;
fi
