#!/usr/bin/env sh
# Custom network module for Waybar — text field will contain ONLY the icon.
set -eu

USER_NAME="${USER:-$(whoami)}"
CACHE_DIR="/tmp"
CACHE_FILE_PREFIX="$CACHE_DIR/waybar-net-$USER_NAME"

ICON_ETH="󰛳"
ICON_VPN=""
ICON_DISCONNECTED="󰤭"
WIFI_ICONS="󰤯|󰤟|󰤢|󰤥|󰤨"

json_out() {
  # $1 text, $2 tooltip, $3 class (optional)
  if [ -z "${3:-}" ]; then
    printf '{"text":"%s","tooltip":"%s"}\n' "$1" "$2"
  else
    printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$1" "$2" "$3"
  fi
}

get_default_dev() {
  ip route get 8.8.8.8 2>/dev/null | awk '{for(i=1;i<=NF;i++){if($i=="dev"){print $(i+1); exit}}}'
}

is_virtual_iface() {
  case "$1" in
    tun*|tap*|wg*|ppp*|vpn*|proton*|lo|docker*|veth*|br-*|virbr*|vmnet*|ovs-*|flannel.*) return 0 ;;
    *) return 1 ;;
  esac
}

find_real_uplink() {
  best=""
  for ifc in $(ls /sys/class/net 2>/dev/null); do
    is_virtual_iface "$ifc" && continue
    if [ -f "/sys/class/net/$ifc/operstate" ] && grep -q "up" "/sys/class/net/$ifc/operstate"; then
      if [ -d "/sys/class/net/$ifc/wireless" ]; then
        printf "%s\n" "$ifc"
        return 0
      fi
      carrier_val="0"
      if [ -f "/sys/class/net/$ifc/carrier" ]; then
        carrier_val=$(cat "/sys/class/net/$ifc/carrier" 2>/dev/null || echo 0)
      fi
      if [ "$carrier_val" = "1" ] && [ -z "$best" ]; then
        best="$ifc"
      elif [ -z "$best" ]; then
        best="$ifc"
      fi
    fi
  done
  if [ -n "$best" ]; then
    printf "%s\n" "$best"
    return 0
  fi
  return 1
}

get_ip() {
  ip -4 -o addr show dev "$1" 2>/dev/null | awk '{for(i=1;i<=NF;i++){if($i=="inet"){print $(i+1); exit}}}' | cut -d/ -f1 || true
}

get_wifi_info() {
  if command -v iw >/dev/null 2>&1; then
    link=$(iw dev "$1" link 2>/dev/null || true)
    ssid=$(printf "%s" "$link" | awk -F'SSID: ' '/SSID:/ {print $2; exit}' | tr -d '\n' || true)
    signal=$(printf "%s" "$link" | awk -F'signal: ' '/signal:/ {print $2; exit}' | awk '{print $1}' || true)
    printf "%s|%s" "$ssid" "$signal"
  else
    printf "|"
  fi
}

wifi_icon_by_signal() {
  sig="$1"
  idx=0
  if [ -n "$sig" ]; then
    sig=${sig%.*}
    if [ "$(expr "$sig" \>= -50 2>/dev/null || echo 0)" -eq 1 ]; then idx=4
    elif [ "$(expr "$sig" \>= -60 2>/dev/null || echo 0)" -eq 1 ]; then idx=3
    elif [ "$(expr "$sig" \>= -70 2>/dev/null || echo 0)" -eq 1 ]; then idx=2
    elif [ "$(expr "$sig" \>= -80 2>/dev/null || echo 0)" -eq 1 ]; then idx=1
    fi
  fi
  printf "%s" "$(printf "%s" "$WIFI_ICONS" | awk -F"|" -v n="$((idx+1))" '{print $n}')"
}

# MAIN
DEFAULT_DEV=$(get_default_dev || true)
IFACE="$DEFAULT_DEV"
ICON="$ICON_DISCONNECTED"
CLASS="network"
TOOLTIP="No network"

if [ -n "$DEFAULT_DEV" ]; then
  if is_virtual_iface "$DEFAULT_DEV"; then
    uplink=$(find_real_uplink || true)
    if [ -n "$uplink" ]; then
      IFACE="$uplink"
    fi
  fi
fi

if [ -n "$IFACE" ] && [ -f "/sys/class/net/$IFACE/operstate" ] && grep -q "up" "/sys/class/net/$IFACE/operstate"; then
  if [ -d "/sys/class/net/$IFACE/wireless" ]; then
    wifiinfo=$(get_wifi_info "$IFACE")
    ssid=${wifiinfo%%|*}
    sig=${wifiinfo##*|}
    ICON=$(wifi_icon_by_signal "$sig")
    CLASS="network wifi"
    TOOLTIP="$IFACE\nSSID: ${ssid:-unknown}\nIP: $(get_ip "$IFACE")"
  else
    ICON="$ICON_ETH"
    CLASS="network ethernet"
    TOOLTIP="$IFACE\nIP: $(get_ip "$IFACE")"
  fi
else
  ICON="$ICON_DISCONNECTED"
  TOOLTIP="${IFACE:-no-iface}\nDisconnected"
  CLASS="network disconnected"
fi

# Si quieres que el icono sea solo el icono (sin IP/SSID/padlock) mantenemos TEXT igual al ICON:
TEXT="$ICON"

# Devuelve JSON: text SOLO contiene el icono
json_out "$TEXT" "$TOOLTIP" "$CLASS"