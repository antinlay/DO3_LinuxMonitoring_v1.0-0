#!/bin/bash

start_time=$(date +%s.%N);
dir_pr=$(pwd)
dir_0="/05"

if [[ $dir_pr == *"$dir_0" ]] ;
then
  . ../02/var.sh  
  # Get DIR
  get_dir=$1

  # Total number of folders, including subfolders
  num_folders=$(du $get_dir | wc -l);
  echo "Total number of folders (including all nested ones) = $num_folders"

  # Top 5 folders with largest size in descending order (path and size)
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):";
  . msf05.sh;
  # Total number of files
  num_files=$(find $get_dir -type f | wc -l)
  echo "Total number of files = $num_files"

  # # Считаем количество файлов с расширением .conf
  # num_conf_files=$(find $get_dir -type f -name "*.conf" | wc -l)
  # echo "Configuration files (with the .conf extension) = $num_conf_files"

  # # Считаем количество текстовых файлов
  # num_text_files=$(find $get_dir -type f -exec file {} ; | grep "text" | wc -l)
  # echo "Text files = $num_text_files"

  # # Считаем количество исполняемых файлов
  # num_exec_files=$(find $get_dir -type f -perm /a+x | wc -l)
  # echo "Executable files = $num_exec_files"

  # # Считаем количество файлов с расширением .log
  # num_log_files=$(find $get_dir -type f -name "*.log" | wc -l)
  # echo "Log files (with the extension .log) = $num_log_files"

  # # Считаем количество архивных файлов
  # num_archive_files=$(find $get_dir -type f -exec file {} ; | grep "archive" | wc -l)
  # echo "Archive files = $num_archive_files"

  # # Считаем количество символических ссылок
  # num_symlinks=$(find $get_dir -type l | wc -l)
  # echo "Symbolic links = $num_symlinks"

  # # Выводим топ 10 файлов максимального размера (путь, размер, тип)
  # echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  # find $get_dir -type f -exec du -sh {} + | sort -rh | head -n 10 | nl -v 0

  # #!/bin/bash

  # # Get a list of all executable files in the current directory and its subdirectories
  # files=$(find $get_dir -type f -executable)

  # # Initialize an array to store the sizes and hashes of the executable files
  # declare -A sizes
  # declare -A hashes

  # # Calculate the size and hash of each executable file
  # for file in $files; do
  #   size=$(stat -c%s "$file")
  #   hash=$(md5sum "$file" | cut -d' ' -f1)
  #   sizes[$file]=$size
  #   hashes[$file]=$hash
  # done

  # # Sort the files by size in descending order
  # sorted_files=$(for file in "${!sizes[@]}"; do
  #   printf "%s %s\n" "${sizes[$file]}" "$file"
  # done | sort -nr)

  # # Output the top 10 files, along with their path, size, and hash
  # i=0
  # echo "TOP 10 executable files of maximum size arranged in descending order:"
  # for line in $sorted_files; do
  #   size=$(echo "$line" | awk '{print $1}')
  #   file=$(echo "$line" | awk '{print $2}')
  #   # hash=${hashes[$file]}
  #   printf "%d - %s %d bytes\n" $((++$i)) "$file" "$size"
  #   if [ "$i" -ge 10 ]; then
  #     break
  #   fi
  # done

  # end_time=$(date +%s.%N)

  # # Print the execution time
  # echo_time=$(echo $end_time - $start_time | bc)
  # # time_echo=$(echo $echo_time | sed "s/\./,/")
  # printf "Script execution time (in seconds) = %.1f" "$echo_time"
else
    echo "Error: Please run script from *src$dir_0/ directory!"
    exit 1
fi