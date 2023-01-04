#!/bin/bash

if [ "$#" -eq 0 ] || [ "$#" -gt 1 ] ;
then 
    echo "NOT SET PARAM"
else
    if [[ $1 =~ ^[a-z] ]] ;
    then
        echo $1
    else
        echo "ENTER TEXT PARAM"
    fi
fi