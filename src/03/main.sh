#!/bin/bash

declare dir_pr=$(pwd) dir_0="/03";

if [[ $dir_pr == *"$dir_0" ]];
then
    if [[ $# -eq 4 ]] && [[ $1 =~ ^[1-6]$ ]] && [[ $2 =~ ^[1-6]$ ]] && [[ $3 =~ ^[1-6]$ ]] && [[ $4 =~ ^[1-6]$ ]];
    then 
        # The parameters are numeric. From 1 to 6, for example:
        # script03.sh 1 3 4 5
        . color.sh;
        declare col1_bg=$1 col1_font=$2 col2_bg=$3 col2_font=$4;
        if [ "$col1_bg" -eq "$col1_font" ]; then
            echo "Warning: column 1 background and font color cannot be the same. Please try again.";
            exit 0;
        fi
        # Check if column 2 background and font color are the same
        if [ "$col2_bg" -eq "$col2_font" ]; then
            echo "Warning: column 2 background and font color cannot be the same. Please try again.";
            exit 0;
        fi
        . cases.sh;
        . ../02/var.sh;
        . echo03.sh;
    else
        echo "Error:required are 4 numeric arguments from 1 to 6.";
        exit 1;
    fi
else
    echo "Error: please run script from $dir_0/ directory!";
    exit 1;
fi