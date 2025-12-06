#!/usr/bin/env bash
# Simple on-click action for the network module
# Try to open a GUI network manager, fallback to nmcli and notify

if command -v nm-connection-editor >/dev/null 2>&1; then
  nm-connection-editor &
  exit 0
fi

if command -v gnome-control-center >/dev/null 2>&1; then
  gnome-control-center network &
  exit 0
fi

# fallback: show nmcli output with rofi if available
OUTPUT=$(nmcli -t -f NAME,DEVICE,STATE connection show --active 2>/dev/null || true)
if command -v rofi >/dev/null 2>&1; then
  printf "%s\n\n%s\n" "Active connections:" "$OUTPUT" | rofi -dmenu -p "Network"
elif command -v dmenu >/dev/null 2>&1; then
  printf "%s\n\n%s\n" "Active connections:" "$OUTPUT" | dmenu -p "Network"
else
  # final fallback: notify
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Network" "Active:\n$OUTPUT"
  else
    printf "Active connections:\n%s\n" "$OUTPUT"
  fi
fi