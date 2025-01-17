#!/bin/bash

LOG_FILE="/var/log/openvpn_connect.log"
TOKEN="YOUT_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

tail -f /var/log/syslog | while read LINE
do
    echo "$LINE" | grep "VERIFY OK: depth=0, CN=" > /dev/null
    if [ $? = 0 ]; then
        USER=$(echo "$LINE" | sed 's/.*CN=\([^,]*\).*/\1/')
        #TIME=$(date "+%Y-%m-%d %H:%M:%S")
        TIME=$(date "+%H:%M:%S")
        echo "$TIME - $USER" >> $LOG_FILE
        MESSAGE="User $USER connected to OpenVPN at $TIME"
        curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
    fi
done