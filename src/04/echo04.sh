#!/bin/bash

printf "\n";
get_color $col1_bg $default;
echo "Column 1 background = $code ($color)";
get_color $col1_font $default;
echo "Column 1 font color = $code ($color)";
get_color $col2_bg $default;
echo "Column 2 background = $code ($color)";
get_color $col2_font $default;
echo "Column 2 font color = $code ($color)";
