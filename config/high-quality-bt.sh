#!/bin/bash

#This script is for resetting my headphones bluetooth configurations to the best quality in case it changes due to video calls

DEVICE_MAC="F4:9D:8A:34:B0:96"

#Check if SoundCore Q45 is connected
if bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes"; then
	echo "✅ SoundCore Q45 connected"
else
	echo "❌ SoundCore Q45 not connected!" 
	exit 1
fi

#Device ID number will change with each connect
CARD_ID=$(pactl list short cards | grep F4_9D_8A_34_B0_96 | awk '{print $1}')

#In case it will take time to fully connect
for i in {1..5}; do
	if pactl list cards | grep -A10 "$card_ID" | grep -q "a2dp-sink-sbc_xq"; then
		pactl set-card-profile "$CARD_ID" a2dp-sink-sbc_xq
		echo "Profile set!"
		exit 0
	else
		echo "waiting for profile to load..."
		sleep 1
	fi
done

echo "failed to set profile. Try again later."
exit 1
