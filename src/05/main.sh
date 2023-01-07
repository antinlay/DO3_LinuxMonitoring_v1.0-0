#!/bin/bash

start_time=$(date +%s.%N)  
# Получаем текущую директорию
current_dir=$1

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
find $current_dir -type f -exec du -sh {} + | sort -rh | head -n 10 | nl -v 0

#!/bin/bash

# Get a list of all executable files in the current directory and its subdirectories
files=$(find $current_dir -type f -executable)

# Initialize an array to store the sizes and hashes of the executable files
declare -A sizes
declare -A hashes

# Calculate the size and hash of each executable file
for file in $files; do
  size=$(stat -c%s "$file")
  hash=$(md5sum "$file" | cut -d' ' -f1)
  sizes[$file]=$size
  hashes[$file]=$hash
done

# Sort the files by size in descending order
sorted_files=$(for file in "${!sizes[@]}"; do
  printf "%s %s\n" "${sizes[$file]}" "$file"
done | sort -nr)

# Output the top 10 files, along with their path, size, and hash
i=0
echo "TOP 10 executable files of maximum size arranged in descending order:"
for line in $sorted_files; do
  size=$(echo "$line" | awk '{print $1}')
  file=$(echo "$line" | awk '{print $2}')
  hash=${hashes[$file]}
  printf "%d - %s %d bytes %s\n" $((++$i)) "$file" "$size" "$hash"
  if [ "$i" -ge 10 ]; then
    break
  fi
done

end_time=$(date +%s.%N)

# Print the execution time
echo_time=$(echo $end_time - $start_time | bc)
# time_echo=$(echo $echo_time | sed "s/\./,/")
printf "Script execution time (in seconds) = %.1f" "$echo_time"
