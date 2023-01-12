#!/bin/bash

declare temp=".temp";

./echo.sh | tee "${temp}";
echo "Create file with sysinfo? (y - yes, other - no)";
read -s item;
case "$item" in
    y|Y) FILENAME=$(date "+%d_%m_%Y_%H_%M_%S.status")
        echo "Report ${FILENAME} was created!"
        $(mv ${temp} ${FILENAME}) ;;
    *) echo "File didn't created"
        rm "${temp}";
        exit 0 ;;
esac
