#!/bin/bash

# HOSTNAME = network name
echo "HOSTNAME = "$HOSTNAME;
# TIMEZONE = time zone as: America/New_York UTC -5 (time zone must be taken from the system and be correct for the current location)
echo "TIMEZONE = "$TIMEZONE;
# USER = current user who ran the script
echo "USER =" $USER;
# OS = type and version of operating system
echo "OS =" $OS;
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
echo "RAM_TOTAL =" $RAM_TOTAL;
# RAM_USED = used memory size in GB with an accuracy of three decimal places
echo "RAM_USED =" $RAM_USED;
# RAM_FREE = free memory size in GB, with an accuracy of three decimal places
echo "RAM_FREE =" $RAM_FREE;
# SPACE_ROOT = root partition size in MB, with an accuracy of two decimal places, as 254.25 MB
echo "SPACE_ROOT =" $SPACE_ROOT;
# SPACE_ROOT_USED = size of used space of the root partition in MB, with an accuracy of two decimal places
echo "SPACE_ROOT_USED =" $SPACE_ROOT_USED;
# SPACE_ROOT_FREE = size of free space of the root partition in MB, with an accuracy of two decimal places
echo "SPACE_ROOT_FREE =" $SPACE_ROOT_FREE;

# After outputting the values, suggest writing the data to a file (ask the user to answer Y/N).
# Responses Y and y are considered positive, all others - negative.

# If the user agrees, create a file in the current directory containing the information that had been outputted. The file name must looks like: DD_MM_YY_HH_MM_SS.status (The time in the file name must indicate when the data was saved).