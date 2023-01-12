#!/bin/bash

# OS = type and version of operating system
OSNAME=$(grep -e "PRETTY_NAME=" /etc/os-release | cut -d'=' -f2);
OSVER=$(awk '{print $1}' /proc/version);
# TIMEZONE = time zone as: America/New_York UTC -5 (time zone must be taken from the system and be correct for the current location)
TIMEZONE=$(timedatectl| grep "Time" | awk '{print $3, $4, $5}' | sed -E 's/^(.*)\((.*), (.*)00\)/\1 \2 \3/' | awk '{ printf ("%s %s %d", $1, $2, $3) }');
# DATE = current time as: 12 May 2020 12:24:36
DATE=$(date "+%d %B %Y %T");
# UPTIME = system uptime
UPTIME=$(uptime | sed -E 's/^ [0-9][0-9]:[0-9][0-9]:[0-9][0-9] up  (.*),.*[0-9] user.*/\1/');
# UPTIME_SEC = system uptime in seconds
UPTIME_SEC=$(awk '{ printf ("%.f", $1) }' /proc/uptime);
INF=$(ip route list | awk '/^default/ {print $5}');
# networkctl status
# IP = _ip address of the machine on any of the network interfaces
IP=$(ip -o -f inet addr show $INF | awk '/scope global/ {print $4}' | cut -d/ -f1);
# MASK = network mask of any of the network interfaces as: xxx.xxx.xxx.xxx.
MASK=$(ifconfig | grep $IP | awk '{print $4}');
# GATEWAY = default gateway ip
GATEWAY=$(ip r | grep default | awk '{print $3}');
# RAM_TOTAL = main memory size in GB with an accuracy of three decimal places as: 3.125 GB
RAM_TOTAL=$(free -t -m | grep "Mem:" | awk '{ printf("%0.3f", $2 / 1024) }');
# RAM_USED = used memory size in GB with an accuracy of three decimal places
RAM_USED=$(free -t -m | grep "Mem:" | awk '{ printf("%0.3f", $3 / 1024) }');
# RAM_FREE = free memory size in GB, with an accuracy of three decimal places
RAM_FREE=$(free -t -m | grep "Mem:" | awk '{ printf("%0.3f", $4 / 1024) }');
# SPACE_ROOT = root partition size in MB, with an accuracy of two decimal places, as 254.25 MB
SPACE_ROOT=$(df -k / | grep "dev" | awk '{printf("%0.2f", ($3 + $4) / 1024)}');
# SPACE_ROOT_USED = size of used space of the root partition in MB, with an accuracy of two decimal places
SPACE_ROOT_USED=$(df -k / | grep "dev" | awk '{printf("%0.2f", $3 / 1024)}');
# SPACE_ROOT_FREE = size of free space of the root partition in MB, with an accuracy of two decimal places
SPACE_ROOT_FREE=$(df -k / | grep "dev" | awk '{printf("%0.2f", $4 / 1024)}');
