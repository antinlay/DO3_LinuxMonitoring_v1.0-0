#!/bin/bash

dir_pr=$(pwd)
dir_0=$(pwd)

if [[ $dir_pr == *"$dir_0" ]] ;
then
    . echo.sh

    # After outputting the values, suggest writing the data to a file (ask the user to answer Y/N).
    # Responses Y and y are considered positive, all others - negative.
    # If the user agrees, create a file in the current directory containing the information that had been outputted. The file name must looks like: DD_MM_YY_HH_MM_SS.status (The time in the file name must indicate when the data was saved).

    echo "Create file with sysinfo? (y - yes, other - no)"
    read item
    case "$item" in
        y|Y) echo "$FILENAME save!"
            touch $FILENAME

            echo "HOSTNAME = "$HOSTNAME >> $FILENAME
            echo "TIMEZONE =" $TIMEZONE >> $FILENAME
            echo "USER =" $USER >> $FILENAME
            echo "OS =" $OSVER >> $FILENAME
            echo "DATE =" $DATE >> $FILENAME
            echo "UPTIME =" $UPTIME >> $FILENAME
            echo "UPTIME_SEC =" $UPTIME_SEC >> $FILENAME
            echo "IP =" $IP >> $FILENAME
            echo "MASK =" $MASK >> $FILENAME
            echo "GATEWAY =" $GATEWAY >> $FILENAME
            echo "RAM_TOTAL =" $RAM_TOTAL "GB" >> $FILENAME
            echo "RAM_USED =" $RAM_USED "GB" >> $FILENAME
            echo "RAM_FREE =" $RAM_FREE "GB" >> $FILENAME
            echo "SPACE_ROOT =" $SPACE_ROOT "MB" >> $FILENAME
            echo "SPACE_ROOT_USED =" $SPACE_ROOT_USED "MB" >> $FILENAME
            echo "SPACE_ROOT_FREE =" $SPACE_ROOT_FREE "MB" >> $FILENAME;;
        *) echo "File didn't created"
            exit 0
            ;;
    esac
else
    echo "Error: Please run script from *src$dir_0/ directory!"
    exit 1
fi