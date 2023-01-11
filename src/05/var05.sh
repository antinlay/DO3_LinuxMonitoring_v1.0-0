#!/bin/bash

num_folders=$(du "${get_dir}" | wc -l);
num_files=$(find "${get_dir}" -type f | wc -l);
exe_files=$(find "${get_dir}" -type f -executable | wc -l);
conf_files=$(find "${get_dir}" -type f -name "*.conf" | wc -l);
text_files=$(find "${get_dir}" -type f -name "*.txt" | wc -l);
log_files=$(find "${get_dir}" -type f -name "*.log" | wc -l);
arch_files=$(find "${get_dir}" -type f -name "*.zip" -or -name "*.tz" -or -name "*.tar" -or -name "*.shar" -or -name "*.7z -or -name "*.rar""| wc -l);
symb_files=$(find "${get_dir}" -type l | wc -l);