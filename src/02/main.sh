#!/bin/bash
OSNAME=`grep '^NAME' /etc/os-release`;
OSVER=`grep -e "VERSION=" /etc/os-release`;
# TZ=`timedatectl| grep -i "time" | awk '{print $6}'`;
TIMEZONE=`timedatectl| grep "Time" | awk '{print $3, $4, $5}'`;
DATE=`date "+%d %B %Y %T"`;
UPTIME=`uptime`;
UPTIME_SEC=`awk '{print $1}' /proc/uptime`;
INF=`ip route list | awk '/^default/ {print $5}'`;
IP=`ip -o -f inet addr show $INF | awk '/scope global/ {print $4}'`;
MASK=`ifconfig | grep 'netmask [0-9]\{3\}\.[0-9]\{3\}' | awk '{print $4}'`;
GATEWAY=`ip r | grep default | awk '{print $3}'`;
RAM_TOTAL=`free -t -m | grep "Total" | awk '{ printf("%0.3f", $2 / 1024) }'`;
RAM_USED=`free -t -m | grep "Total" | awk '{ printf("%0.3f", $3 / 1024) }'`;
RAM_FREE=`free -t -m | grep "Total" | awk '{ printf("%0.3f", ($2 - $3) / 1024) }'`;
SPACE_ROOT=`df -k / | grep "dev" | awk '{printf("%0.2f", ($3 + $4) / 1024)}'`;
SPACE_ROOT_USED=`df -k / | grep "dev" | awk '{printf("%0.2f", $3 / 1024)}'`;
SPACE_ROOT_FREE=`df -k / | grep "dev" | awk '{printf("%0.2f", $4 / 1024)}'`;
FILENAME=`date "+%d_%m_%Y_%H_%M_%S.status"`

# HOSTNAME = network name
echo "HOSTNAME = "$HOSTNAME 
# TIMEZONE = time zone as: America/New_York UTC -5 (time zone must be taken from the system and be correct for the current location)
echo "TIMEZONE =" $TIMEZONE;
# USER = current user who ran the script
echo "USER =" $USER;
# OS = type and version of operating system
echo "OS =" $OSVER;
# DATE = current time as: 12 May 2020 12:24:36
echo "DATE =" $DATE;
# UPTIME = system uptime
echo "UPTIME =" $UPTIME;
# UPTIME_SEC = system uptime in seconds
echo "UPTIME_SEC =" $UPTIME_SEC;
# IP = _ip address of the machine on any of the network interfaces
echo "IP =" $IP;
# MASK = network mask of any of the network interfaces as: xxx.xxx.xxx.xxx.
echo "MASK =" $MASK;
# GATEWAY = default gateway ip
echo "GATEWAY =" $GATEWAY;
# RAM_TOTAL = main memory size in GB with an accuracy of three decimal places as: 3.125 GB
echo "RAM_TOTAL =" $RAM_TOTAL "GB";
# RAM_USED = used memory size in GB with an accuracy of three decimal places
echo "RAM_USED =" $RAM_USED "GB";
# RAM_FREE = free memory size in GB, with an accuracy of three decimal places
echo "RAM_FREE =" $RAM_FREE "GB";
# SPACE_ROOT = root partition size in MB, with an accuracy of two decimal places, as 254.25 MB
echo "SPACE_ROOT =" $SPACE_ROOT "MB";
# SPACE_ROOT_USED = size of used space of the root partition in MB, with an accuracy of two decimal places
echo "SPACE_ROOT_USED =" $SPACE_ROOT_USED "MB";
# SPACE_ROOT_FREE = size of free space of the root partition in MB, with an accuracy of two decimal places
echo "SPACE_ROOT_FREE =" $SPACE_ROOT_FREE "MB";

echo "Create file with sysinfo?"
read item
case "$item" in
    y|Y) echo "Enter «y», creating file"
        touch $FILENAME

        echo "HOSTNAME = "$HOSTNAME >> $FILENAME
        echo "TIMEZONE =" $TIMEZONE >> $FILENAME
        echo "USER =" $USER >> $FILENAME
        echo "OS =" $OSVER >> $FILENAME
        echo "DATE =" $DATE >> $FILENAME
        echo "UPTIME =" $UPTIME >> $FILENAME
        echo "UPTIME_SEC =" $UPTIME_SEC >> $FILENAME
        echo "IP =" $IP >> $FILENAME
        echo "MASK =" $MASK >> $FILENAME
        echo "GATEWAY =" $GATEWAY >> $FILENAME
        echo "RAM_TOTAL =" $RAM_TOTAL "GB" >> $FILENAME
        echo "RAM_USED =" $RAM_USED "GB" >> $FILENAME
        echo "RAM_FREE =" $RAM_FREE "GB" >> $FILENAME
        echo "SPACE_ROOT =" $SPACE_ROOT "MB" >> $FILENAME
        echo "SPACE_ROOT_USED =" $SPACE_ROOT_USED "MB" >> $FILENAME
        echo "SPACE_ROOT_FREE =" $SPACE_ROOT_FREE "MB" >> $FILENAME;;
    *) echo "File is not create"
        exit 0
        ;;
esac
# After outputting the values, suggest writing the data to a file (ask the user to answer Y/N).
# Responses Y and y are considered positive, all others - negative.

# If the user agrees, create a file in the current directory containing the information that had been outputted. The file name must looks like: DD_MM_YY_HH_MM_SS.status (The time in the file name must indicate when the data was saved).