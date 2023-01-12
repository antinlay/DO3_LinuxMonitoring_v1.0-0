#!/bin/bash

# Default colour values
declare default_column1_background=6 default_column1_font_color=1 default_column2_background=4 default_column2_font_color=2 default=0;

set_default() {
    col1_bg=$default_column1_background;
    col1_font=$default_column1_font_color;
    col2_bg=$default_column2_background;
    col2_font=$default_column2_font_color;
    default=1;
};

set_cfg() {
    col1_bg=$column1_background;
    col1_font=$column1_font_color;
    col2_bg=$column2_background;
    col2_font=$column2_font_color;
    default=0;
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
    if [[ $2 == 1 ]];
        then
        code="default";
    fi
};
