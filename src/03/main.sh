#!/bin/bash

if [ $# -ne 4 ] ;
then 
    echo "Error: 4 arguments are required."
    exit 1
else
    # The parameters are numeric. From 1 to 6, for example:
    # script03.sh 1 3 4 5
    if [[ $1 =~ ^[1-6]$ ]] && [[ $2 =~ ^[1-6]$ ]] && [[ $3 =~ ^[1-6]$ ]] && [[ $4 =~ ^[1-6]$ ]] ;
    then
        . color.sh
        # Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)
        col1_bg=$1
        # Parameter 2 is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)
        col1_font=$2
        # Parameter 3 is the background of the values (after the "=" sign)
        col2_bg=$3
        # Parameter 4 is the font colour of the values (after the '=' sign)
        col2_font=$4
        # The font and background colours of one column must not match.
        # If matching values are entered, there must be a message describing the problem and offering to call the script again. After the message output, the program should exit correctly.
        # Check if column 1 background and font color are the same
        if [ "$col1_bg" -eq "$col1_font" ]; then
            echo "Error: Column 1 background and font color cannot be the same. Please try again."
            exit 1
        fi

        # Check if column 2 background and font color are the same
        if [ "$col2_bg" -eq "$col2_font" ]; then
            echo "Error: Column 2 background and font color cannot be the same. Please try again."
            exit 1
        fi
        . cases.sh
        . ../02/var.sh
        . echo03.sh
    else
        echo "Error: arguments must be number from 1 to 6!"
        exit 1
    fi
fi
