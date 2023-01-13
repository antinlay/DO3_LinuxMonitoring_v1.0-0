#!/bin/bash

if [[ "$#" -eq 1 ]];
then 
    if [[ "${1}" =~ ^[-+]?[0-9]+([.,][0-9]+)?$ ]]; then
        echo "Error: enter incorrect. Only one text parameter.";
        exit 1;
    else
        echo $1;
    fi
else
    echo "Error: script is run with one text parameter.";
    exit 1;
fi