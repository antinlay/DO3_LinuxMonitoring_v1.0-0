#!/bin/bash

declare dir_pr=$(pwd) dir_0="/04";

if [[ $dir_pr == *"$dir_0" ]];
then
    if [[ $# -ne 0 ]];
    then
        echo "Error: Please run script without parameters.";
        exit 1;
    fi
    . ../03/color.sh;
    . func.sh;
    # Read configuration file
    filename=$(ls *.conf | head -n 1);
    if [ -f $filename ];
    then
        source $filename;
    fi
    # Set parameters from file or default
    if [[ $column1_background =~ ^[1-6]$ ]] && [[ $column1_font_color =~ ^[1-6]$ ]] && [[ $column2_background =~ ^[1-6]$ ]] && [[ $column2_font_color =~ ^[1-6]$ ]];
    then
        set_cfg;
        if [[ "$column1_background" -eq "$column1_font_color" ]];
        then
            echo "Warning: Column 1 background and font color cannot be the same. Set default scheme.";
            set_default;
        fi
        # Check if column 2 background and font color are the same
        if [[ "$column2_background" -eq "$column2_font_color" ]];
        then
            echo "Warning: Column 2 background and font color cannot be the same. Set default scheme.";
            set_default;
        fi
    else
    echo "Warning: some param not range from 1 to 6. Set default scheme.";
    set_default;
    fi
    . ../03/cases.sh;
    . ../02/var.sh;
    . ../03/echo03.sh;
    . echo04.sh;
else
    echo "Error: Please run script from $dir_0/ directory.";
    exit 1;
fi
