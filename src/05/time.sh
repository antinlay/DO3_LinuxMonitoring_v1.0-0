#!/bin/bash

end_time=$(date +%s.%N);
exe_time=$(echo "$end_time - $1" | bc);
time_echo=$(echo $exe_time | sed "s/\./,/");
printf "Script execution time (in seconds) = %.1f\n" "$time_echo";
