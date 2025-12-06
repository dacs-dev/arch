#!/usr/bin/env bash

STATE=/tmp/clock_icon_hidden

# Si no existe, inicializar
if [ ! -f "$STATE" ]; then
    echo "0" > "$STATE"
fi

hidden=$(cat "$STATE")

if [ "$hidden" = "1" ]; then
    # Oculto
    echo '{"text":""}'
else
    # Visible
    echo '{"text":""}'
fi
