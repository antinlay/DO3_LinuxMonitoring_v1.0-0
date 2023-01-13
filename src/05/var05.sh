#!/bin/bash

num_folders=$(du "${1}" | wc -l);
num_files=$(find "${1}" -type f | wc -l);
exe_files=$(find "${1}" -type f -executable | wc -l);
conf_files=$(find "${1}" -type f -name "*.conf" | wc -l);
text_files=$(find "${1}" -type f -name "*.txt" | wc -l);
log_files=$(find "${1}" -type f -name "*.log" | wc -l);
arch_files=$(find "${1}" -type f -name "*.zip" -or -name "*.tz" -or -name "*.tar" -or -name "*.shar" -or -name "*.7z -or -name "*.rar""| wc -l);
symb_files=$(find "${1}" -type l | wc -l);
