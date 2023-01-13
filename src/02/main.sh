#!/bin/bash

declare dir_pr=$(pwd) dir_0="/02";

if [[ $dir_pr == *"$dir_0" ]];
then
    . file.sh
else
    echo "Error: please run script from $dir_0/ directory!";
    exit 1;
fi