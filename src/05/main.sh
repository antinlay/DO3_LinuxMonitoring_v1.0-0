#!/bin/bash

# Получаем текущую директорию
current_dir=$(pwd)

# Считаем количество папок в текущей директории (включая вложенные)
num_folders=$(find $current_dir -type d | wc -l)
echo "Total number of folders (including all nested ones) = $num_folders"

# Считаем размер всех папок в текущей директории (включая вложенные) и выводим топ 5 самых больших
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
find $current_dir -type d -exec du -sh {} + | sort -rh | head -n 5 | nl -v 0

# Считаем количество файлов в текущей директории (включая вложенные)
num_files=$(find $current_dir -type f | wc -l)
echo "Total number of files = $num_files"

# Считаем количество файлов с расширением .conf
num_conf_files=$(find $current_dir -type f -name "*.conf" | wc -l)
echo "Configuration files (with the .conf extension) = $num_conf_files"

# Считаем количество текстовых файлов
num_text_files=$(find $current_dir -type f -exec file {} ; | grep "text" | wc -l)
echo "Text files = $num_text_files"

# Считаем количество исполняемых файлов
num_exec_files=$(find $current_dir -type f -perm /a+x | wc -l)
echo "Executable files = $num_exec_files"

# Считаем количество файлов с расширением .log
num_log_files=$(find $current_dir -type f -name "*.log" | wc -l)
echo "Log files (with the extension .log) = $num_log_files"

# Считаем количество архивных файлов
num_archive_files=$(find $current_dir -type f -exec file {} ; | grep "archive" | wc -l)
echo "Archive files = $num_archive_files"

# Считаем количество символических ссылок
num_symlinks=$(find $current_dir -type l | wc -l)
echo "Symbolic links = $num_symlinks"

# Выводим топ 10 файлов максимального размера (путь, размер, тип)
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
# find $current_dir -type f -exec du -sh {} + | sort -rh | head -n 10 | nl -v 0

# Dictionary to store the top 10 files 
declare -A top_10 
# Start the timer
start_time=$(date +%s)  
# Walk through all the files in the directory tree 
for path in $(find /var -type f);
do
    # Get the size of the file in bytes
    size=$(stat -c%s "$path")
    # Calculate the MD5 hash of the file
    md5_hash=$(md5sum "$path" | cut -d ' ' -f 1)
    # Add the file to the top 10 dictionary if it is an executable and its size is larger than the smallest size in the dictionary
    if [[ -x "$path" ]] && [[ ${#top_10[@]} -lt 10 || $size -gt ${top_10[$(echo ${top_10[@]} | tr ' ' '\n' | sort -n | head -1)]:-0} ]]; then
    top_10[$path]=$size 
    # If the dictionary has more than 10 elements, remove the smallest one
        if [[ ${#top_10[@]} -gt 10 ]]; then
        unset top_10[$(echo ${top_10[@]} | tr ' ' '\n' | sort -n | head -1)]
        fi
    fi
done  
# Print the top 10 files in descending order by size
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
i=1
for path in $(echo ${!top_10[@]} | tr ' ' '\n' | sort -nr -k 2);
do
echo "$i - $path, ${top_10[$path]} bytes, $md5_hash"
(i++)
done  
# Print the execution time
echo "Script execution time (in seconds) = $(($(date +%s) - start_time))"
