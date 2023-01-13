#!/bin/bash

declare temp=".temp";

bash echo.sh | tee "${temp}";
trap "rm -f ${temp}" EXIT;
echo "Create file with sysinfo? (y - yes, other - no)";
read -s item;
case "$item" in
    y|Y) mv ${temp} $(date "+%d_%m_%Y_%H_%M_%S.status")
        echo "Report was created!" ;;
    *) echo "File didn't created"
        exit 0 ;;
esac
