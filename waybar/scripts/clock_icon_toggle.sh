#!/usr/bin/env bash

STATE=/tmp/clock_icon_hidden

if [ ! -f "$STATE" ]; then
    echo "0" > "$STATE"
fi

state=$(cat "$STATE")

if [ "$state" = "0" ]; then
    echo "1" > "$STATE"
else
    echo "0" > "$STATE"
fi

waybar-msg action clock mode
