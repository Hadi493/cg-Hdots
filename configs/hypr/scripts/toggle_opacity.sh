#!/usr/bin/env bash
set -euo pipefail

# Get active window (address) via hyprctl
window_info=$(hyprctl activewindow -j 2>/dev/null || hyprctl activewindow 2>/dev/null)
active_window=$(echo "$window_info" | jq -r '.address' 2>/dev/null || echo "")

if [ -z "$active_window" ] || [ "$active_window" = "null" ]; then
  dunstify "Window Opacity" "No active window found"
  exit 1
fi

# Grab the client block from 'hyprctl clients' (blocks are separated by blank lines)
client_block=$(hyprctl clients 2>/dev/null | awk -v addr="$active_window" 'BEGIN{RS="";} index($0, addr){print; exit}')

# If we see xwayland: 1 in that block, warn and exit (opacity often unreliable)
if printf '%s\n' "$client_block" | grep -qi 'xwayland:[[:space:]]*1'; then
  dunstify "Window Opacity" "Target is XWayland (e.g. Chrome). Opacity may not apply. Try running the browser with --ozone-platform=wayland"
  exit 0
fi

# Per-window state file (so we can toggle)
STATE_FILE="/tmp/hypr_opacity_state_${active_window}"

if [ ! -f "$STATE_FILE" ]; then
  echo "1.0" > "$STATE_FILE"
fi

current_alpha=$(cat "$STATE_FILE" 2>/dev/null || echo "1.0")

# Decide new alpha (toggle 1.0 <-> 0.88)
if awk "BEGIN {exit !($current_alpha >= 0.99)}"; then
  new_alpha=0.80
  msg="Set to transparent (80%)"
else
  new_alpha=1.0
  msg="Set to fully opaque (100%)"
fi

# Apply — hyprctl dispatch setprop is the correct dispatcher
hyprctl dispatch setprop address:$active_window alpha $new_alpha lock
echo "$new_alpha" > "$STATE_FILE"
dunstify "Window Opacity" "$msg"
