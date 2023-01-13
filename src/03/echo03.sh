#!/bin/bash

# HOSTNAME = network name
echo -e ${col1_font_code}${col1_bg_code}"HOSTNAME" ${reset} "=" ${col2_font_code}${col2_bg_code}$HOSTNAME${reset};
echo -e ${col1_font_code}${col1_bg_code}"TIMEZONE" ${reset} "=" ${col2_font_code}${col2_bg_code}$TIMEZONE${reset};
# USER = current user who ran the script
echo -e ${col1_font_code}${col1_bg_code}"USER" ${reset} "=" ${col2_font_code}${col2_bg_code}$USER${reset};
echo -e ${col1_font_code}${col1_bg_code}"OS" ${reset} "=" ${col2_font_code}${col2_bg_code}$OSVER $OSNAME${reset};
echo -e ${col1_font_code}${col1_bg_code}"DATE" ${reset} "=" ${col2_font_code}${col2_bg_code}$DATE${reset};
echo -e ${col1_font_code}${col1_bg_code}"UPTIME" ${reset} "=" ${col2_font_code}${col2_bg_code}$UPTIME${reset};
echo -e ${col1_font_code}${col1_bg_code}"UPTIME_SEC" ${reset} "=" ${col2_font_code}${col2_bg_code}$UPTIME_SEC${reset};
echo -e ${col1_font_code}${col1_bg_code}"IP" ${reset} "=" ${col2_font_code}${col2_bg_code}$IP${reset};
echo -e ${col1_font_code}${col1_bg_code}"MASK" ${reset} "=" ${col2_font_code}${col2_bg_code}$MASK${reset};
echo -e ${col1_font_code}${col1_bg_code}"GATEWAY" ${reset} "=" ${col2_font_code}${col2_bg_code}$GATEWAY${reset};
echo -e ${col1_font_code}${col1_bg_code}"RAM_TOTAL" ${reset} "=" ${col2_font_code}${col2_bg_code}$RAM_TOTAL "GB"${reset};
echo -e ${col1_font_code}${col1_bg_code}"RAM_USED" ${reset} "=" ${col2_font_code}${col2_bg_code}$RAM_USED "GB"${reset};
echo -e ${col1_font_code}${col1_bg_code}"RAM_FREE" ${reset} "=" ${col2_font_code}${col2_bg_code}$RAM_FREE "GB"${reset};
echo -e ${col1_font_code}${col1_bg_code}"SPACE_ROOT" ${reset} "=" ${col2_font_code}${col2_bg_code}$SPACE_ROOT "MB"${reset};
echo -e ${col1_font_code}${col1_bg_code}"SPACE_ROOT_USED" ${reset} "=" ${col2_font_code}${col2_bg_code}$SPACE_ROOT_USED "MB"${reset};
echo -e ${col1_font_code}${col1_bg_code}"SPACE_ROOT_FREE" ${reset} "=" ${col2_font_code}${col2_bg_code}$SPACE_ROOT_FREE "MB"${reset};
