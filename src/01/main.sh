#!/bin/bash

if [ "$#" -eq 1 ] ;
then 
    if [[ "${1}" =~ ^[-+]?[0-9]+([.,][0-9]+)?$ ]]; then
        echo "Error: enter incorrect" >&2
        exit 1
    else
        echo $1
    fi
else
    exit 1
fi