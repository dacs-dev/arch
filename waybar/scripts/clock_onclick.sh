#!/usr/bin/env bash

STATE=/tmp/clock_icon_hidden

# Si no existe, crearlo
if [ ! -f "$STATE" ]; then
    echo "0" > "$STATE"
fi

# Leer estado
state=$(cat "$STATE")

# Toggle
if [ "$state" = "0" ]; then
    echo "1" > "$STATE"   # ocultar icono
else
    echo "0" > "$STATE"   # mostrar icono
fi

# Lanzar el calendario del módulo clock
waybar-msg action clock mode
