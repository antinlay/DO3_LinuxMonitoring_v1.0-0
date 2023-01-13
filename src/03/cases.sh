#!/bin/bash

# Set color codes for column 1 background and font
declare col1_bg_code col1_font_code;

# Set color codes for column 2 background and font
declare col2_bg_code col2_font_code;

# Set color codes for column 1
case "$col1_bg" in
    1) col1_bg_code=$bwhite ;;
    2) col1_bg_code=$bred ;;
    3) col1_bg_code=$bgreen ;;
    4) col1_bg_code=$bblue ;;
    5) col1_bg_code=$bpurple ;;
    6) col1_bg_code=$bblack ;;
    *) echo "Error: column 1 background arg must be from 1 to 6!";
    exit 1;
esac

case "$col1_font" in
    1) col1_font_code=$white ;;
    2) col1_font_code=$red ;;
    3) col1_font_code=$green ;;
    4) col1_font_code=$blue ;;
    5) col1_font_code=$purple ;;
    6) col1_font_code=$black ;;
    *) echo "Error: column 1 font arg must be from 1 to 6!";
    exit 1;
esac

# Set color codes for column 2
case "$col2_bg" in
    1) col2_bg_code=$bwhite ;;
    2) col2_bg_code=$bred ;;
    3) col2_bg_code=$bgreen ;;
    4) col2_bg_code=$bblue ;;
    5) col2_bg_code=$bpurple ;;
    6) col2_bg_code=$bblack ;;
    *) echo "Error: column 2 background arg must be from 1 to 6!";
    exit 1;
esac

case "$col2_font" in
    1) col2_font_code=$white ;;
    2) col2_font_code=$red ;;
    3) col2_font_code=$green ;;
    4) col2_font_code=$blue ;;
    5) col2_font_code=$purple ;;
    6) col2_font_code=$black ;;
    *) echo "Error: column 2 font arg must be from 1 to 6!";
    exit 1;
esac
