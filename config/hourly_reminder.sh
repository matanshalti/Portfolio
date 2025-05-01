#!/bin/bash

# Basic Pomodoro recipe for an uncooked brain
# Rest for 5m every 25m
# Rest for 15m after 4X

POMOS=0

while true
do
    echo -e "\n🍅 Pomodoro started: Focus for 25 minutes."
    notify-send -i face-smile "🍅 Pomodoro" "Focus for 25 minutes!"
    sleep 1500  # 25 minutes

    POMOS=$((POMOS + 1))

    if (( POMOS % 4 == 0 )); then
        echo -e "\n🎉 Long Break: Take 15 minutes!"
        notify-send -i face-cool "🎉 Long Break" "You’ve completed 4 Pomodoros! Take 15 minutes!"
        sleep 900  # 15 minutes
    else
        echo -e "\n🧘‍♂️️ Short Break: Take 5 minutes!"
        notify-send -i coffee "🧘‍♂️️ Short Break" "Take a 5-minute break!"
        sleep 300  # 5 minutes
    fi
done

