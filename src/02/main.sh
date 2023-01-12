#!/bin/bash

declare dir_pr=$(pwd) dir_0="/02";

if [[ $dir_pr == *"$dir_0" ]];
then
    . echo.sh;
    echo "Create file with sysinfo? (y - yes, other - no)";
    read -s item;
    case "$item" in
        y|Y) echo "Report ${FILENAME} was created!"
            $(./echo.sh | tee "${FILENAME}" &> /dev/null) ;;
        *) echo "File didn't created"
            exit 0 ;;
    esac
else
    echo "Error: please run script from $dir_0/ directory!";
    exit 1;
fi