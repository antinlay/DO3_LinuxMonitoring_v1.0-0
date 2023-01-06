#!/bin/bash

if [ "$#" -eq 0 ] || [ "$#" -gt 1 ] ;
then 
    echo "PLESASE SET ONE PARAM"
    exit 1
else
    case $1 in
        ''|*[!a-zA-Z]*) echo "ENTER TEXT PARAM" ;;
        *) echo $1 ;;
    esac
fi