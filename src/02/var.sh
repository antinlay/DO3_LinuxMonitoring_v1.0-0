#!/bin/bash

OSNAME=$(grep '^NAME' /etc/os-release);
OSVER=$(grep -e "VERSION=" /etc/os-release);
TIMEZONE=$(timedatectl| grep "Time" | awk '{print $3, $4, $5}');
DATE=$(date "+%d %B %Y %T");
UPTIME=$(uptime | awk '{print $1}');
UPTIME_SEC=$(awk '{print $1}' /proc/uptime);
INF=$(ip route list | awk '/^default/ {print $5}');
IP=$(ip -o -f inet addr show $INF | awk '/scope global/ {print $4}' | cut -d/ -f1);
MASK=$(ifconfig | grep $IP | awk '{print $4}');
GATEWAY=$(ip r | grep default | awk '{print $3}');
RAM_TOTAL=$(free -t -m | grep "Total" | awk '{ printf("%0.3f", $2 / 1024) }');
RAM_USED=$(free -t -m | grep "Total" | awk '{ printf("%0.3f", $3 / 1024) }');
RAM_FREE=$(free -t -m | grep "Total" | awk '{ printf("%0.3f", ($2 - $3) / 1024) }');
SPACE_ROOT=$(df -k / | grep "dev" | awk '{printf("%0.2f", ($3 + $4) / 1024)}');
SPACE_ROOT_USED=$(df -k / | grep "dev" | awk '{printf("%0.2f", $3 / 1024)}');
SPACE_ROOT_FREE=$(df -k / | grep "dev" | awk '{printf("%0.2f", $4 / 1024)}');
FILENAME=$(date "+%d_%m_%Y_%H_%M_%S.status")