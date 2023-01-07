#!/bin/bash

# Default colour values
default_column1_background=6
default_column1_font_color=1
default_column2_background=4
default_column2_font_color=2
default=0

def () {
    if [ $1 == 1 ]
        then
        code="default"
    fi
};

set_default() {
    # Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)
    col1_bg=$default_column1_background
    # Parameter 2 is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)
    col1_font=$default_column1_font_color
    # Parameter 3 is the background of the values (after the "=" sign)
    col2_bg=$default_column2_background
    # Parameter 4 is the font colour of the values (after the '=' sign)
    col2_font=$default_column2_font_color
    default=1
};

set_cfg() {
    # Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)
    col1_bg=$column1_background
    # Parameter 2 is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)
    col1_font=$column1_font_color
    # Parameter 3 is the background of the values (after the "=" sign)
    col2_bg=$column2_background
    # Parameter 4 is the font colour of the values (after the '=' sign)
    col2_font=$column2_font_color
    default=0
};

get_color () {
    case $1 in
        1) color="white" ;;
        2) color="red" ;;
        3) color="green" ;;
        4) color="blue" ;;
        5) color="purple" ;;
        6) color="black" ;;
    esac
    code=$1
};
