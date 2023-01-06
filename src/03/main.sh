#!/bin/bash

if [ $# -ne 4 ] ;
then 
    echo "Error: 4 arguments are required."
    exit 1
else
    # The parameters are numeric. From 1 to 6, for example:
    # script03.sh 1 3 4 5
    if [[ $1 =~ ^[1-6]$ ]] && [[ $2 =~ ^[1-6]$ ]] && [[ $3 =~ ^[1-6]$ ]] && [[ $4 =~ ^[1-6]$ ]] ;
    then
        # Colour designations: (
        # 1 - white
        white="\e[1;37"
        # 2 - red
        red="\e[1;31"
        # 3 - green
        green="\e[1;32"
        # 4 - blue
        blue="\e[1;34"
        # 5 - purple
        purple="\e[1;35"
        # 6 - black
        black="\e[1;30"

        # 1 - white
        bwhite=";1;47m"
        # 2 - red
        bred=";1;41m"
        # 3 - green
        bgreen=";1;42m"
        # 4 - blue
        bblue=";1;44m"
        # 5 - purple
        bpurple=";1;45m"
        # 6 - black
        bblack=";1;40m"
        # reset
        reset="\e[0m"

        # Parameter 1 is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)
        col1_bg=$1
        # Parameter 2 is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)
        col1_font=$2
        # Parameter 3 is the background of the values (after the "=" sign)
        col2_bg=$3
        # Parameter 4 is the font colour of the values (after the '=' sign)
        col2_font=$4
        # The font and background colours of one column must not match.
        # If matching values are entered, there must be a message describing the problem and offering to call the script again. After the message output, the program should exit correctly.
        # Check if column 1 background and font color are the same
        if [ "$col1_bg" -eq "$col1_font" ]; then
        echo "Error: Column 1 background and font color cannot be the same. Please try again."
        exit 1
        fi

        # Check if column 2 background and font color are the same
        if [ "$col2_bg" -eq "$col2_font" ]; then
        echo "Error: Column 2 background and font color cannot be the same. Please try again."
        exit 1
        fi

        # Set color codes for column 1 background and font
        col1_bg_code=""
        col1_font_code=""

        # Set color codes for column 2 background and font
        col2_bg_code=""
        col2_font_code=""

        # Set color codes for column 1
        case "$col1_bg" in
            1) col1_bg_code=$bwhite ;;
            2) col1_bg_code=$bred ;;
            3) col1_bg_code=$bgreen ;;
            4) col1_bg_code=$bblue ;;
            5) col1_bg_code=$bpurple ;;
            6) col1_bg_code=$bblack ;;
            *) echo "Error: column 1 background arg must be from 1 to 6!";
            exit 1 ;
        esac

        case "$col1_font" in
            1) col1_font_code=$white ;;
            2) col1_font_code=$red ;;
            3) col1_font_code=$green ;;
            4) col1_font_code=$blue ;;
            5) col1_font_code=$purple ;;
            6) col1_font_code=$black ;;
            *) echo "Error: column 1 font arg must be from 1 to 6!";
            exit 1 ;
        esac

        # Set color codes for column 2
        case "$col2_bg" in
            1) col2_bg_code=$bwhite ;;
            2) col2_bg_code=$bred ;;
            3) col2_bg_code=$bgreen ;;
            4) col2_bg_code=$bblue ;;
            5) col2_bg_code=$bpurple ;;
            6) col2_bg_code=$bblack ;;
            *) echo "Error: column 2 background arg must be from 1 to 6!";
            exit 1 ;
        esac

        case "$col2_font" in
            1) col2_font_code=$white ;;
            2) col2_font_code=$red ;;
            3) col2_font_code=$green ;;
            4) col2_font_code=$blue ;;
            5) col2_font_code=$purple ;;
            6) col2_font_code=$black ;;
            *) echo "Error: column 2 font arg must be from 1 to 6!";
            exit 1 ;
        esac

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
        # FILENAME=`date "+%d_%m_%Y_%H_%M_%S.status"`

        # HOSTNAME = network name
        echo -e ${col1_font_code}${col1_bg_code}"HOSTNAME" ${reset} "=" ${col2_font_code}${col2_bg_code}$HOSTNAME${reset};
        # TIMEZONE = time zone as: America/New_York UTC -5 (time zone must be taken from the system and be correct for the current location)
        echo -e "${col1_font_code}${col1_bg_code}TIMEZONE" ${reset} "=" ${col2_font_code}${col2_bg_code}$TIMEZONE${reset};
        # USER = current user who ran the script
        echo -e "${col1_font_code}${col1_bg_code}USER" ${reset} "=" ${col2_font_code}${col2_bg_code}$USER${reset};
        # OS = type and version of operating system
        echo -e "${col1_font_code}${col1_bg_code}OS" ${reset} "=" ${col2_font_code}${col2_bg_code}$OSVER${reset};
        # DATE = current time as: 12 May 2020 12:24:36
        echo -e "${col1_font_code}${col1_bg_code}DATE" ${reset} "=" ${col2_font_code}${col2_bg_code}$DATE${reset};
        # UPTIME = system uptime
        echo -e "${col1_font_code}${col1_bg_code}UPTIME" ${reset} "=" ${col2_font_code}${col2_bg_code}$UPTIME${reset};
        # UPTIME_SEC = system uptime in seconds
        echo -e "${col1_font_code}${col1_bg_code}UPTIME_SEC" ${reset} "=" ${col2_font_code}${col2_bg_code}$UPTIME_SEC${reset};
        # IP = _ip address of the machine on any of the network interfaces
        echo -e "${col1_font_code}${col1_bg_code}IP" ${reset} "=" ${col2_font_code}${col2_bg_code}$IP${reset};
        # MASK = network mask of any of the network interfaces as: xxx.xxx.xxx.xxx.
        echo -e "${col1_font_code}${col1_bg_code}MASK" ${reset} "=" ${col2_font_code}${col2_bg_code}$MASK${reset};
        # GATEWAY = default gateway ip
        echo -e "${col1_font_code}${col1_bg_code}GATEWAY" ${reset} "=" ${col2_font_code}${col2_bg_code}$GATEWAY${reset};
        # RAM_TOTAL = main memory size in GB with an accuracy of three decimal places as: 3.125 GB
        echo -e "${col1_font_code}${col1_bg_code}RAM_TOTAL" ${reset} "=" ${col2_font_code}${col2_bg_code}$RAM_TOTAL "GB"${reset};
        # RAM_USED = used memory size in GB with an accuracy of three decimal places
        echo -e "${col1_font_code}${col1_bg_code}RAM_USED" ${reset} "=" ${col2_font_code}${col2_bg_code}$RAM_USED "GB"${reset};
        # RAM_FREE = free memory size in GB, with an accuracy of three decimal places
        echo -e "${col1_font_code}${col1_bg_code}RAM_FREE" ${reset} "=" ${col2_font_code}${col2_bg_code}$RAM_FREE "GB"${reset};
        # SPACE_ROOT = root partition size in MB, with an accuracy of two decimal places, as 254.25 MB
        echo -e "${col1_font_code}${col1_bg_code}SPACE_ROOT" ${reset} "=" ${col2_font_code}${col2_bg_code}$SPACE_ROOT "MB"${reset};
        # SPACE_ROOT_USED = size of used space of the root partition in MB, with an accuracy of two decimal places
        echo -e "${col1_font_code}${col1_bg_code}SPACE_ROOT_USED" ${reset} "=" ${col2_font_code}${col2_bg_code}$SPACE_ROOT_USED "MB"${reset};
        # SPACE_ROOT_FREE = size of free space of the root partition in MB, with an accuracy of two decimal places
        echo -e "${col1_font_code}${col1_bg_code}SPACE_ROOT_FREE" ${reset} "=" ${col2_font_code}${col2_bg_code}$SPACE_ROOT_FREE "MB"${reset};
        # echo -e "\e[0;33;1;44mYellow Underlined Text on Blue Background\e[0m"
    else
        echo "Error: arguments must be number from 1 to 6!"
        exit 1
    fi
fi
