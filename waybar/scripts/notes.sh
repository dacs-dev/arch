#!/bin/bash

NOTES="$HOME/.local/notes"

mkdir -p "$NOTES"

while true; do
    list="📝 Nueva nota\n🔍 Buscar nota\n$(ls "$NOTES")"

    choice=$(printf "%s\n" "$list" \
        | tofi --prompt-text "Notas: " --config ~/.config/tofi/wifi)

    [ -z "$choice" ] && exit

    case "$choice" in
        "📝 Nueva nota")
            name=$(tofi --prompt-text "Nombre nota:" --config ~/.config/tofi/wifi)
            [ -z "$name" ] && continue
            ${EDITOR:-nano} "$NOTES/$name.txt"
            ;;
        "🔍 Buscar nota")
            fzf=$(ls "$NOTES" | tofi --prompt-text "Buscar:" --config ~/.config/tofi/wifi)
            [ -z "$fzf" ] && continue
            ${EDITOR:-nano} "$NOTES/$fzf"
            ;;
        *)
            ${EDITOR:-nano} "$NOTES/$choice"
            ;;
    esac
done
