#!/bin/bash

# Step size
STEP=10

# Paths (for max value)
MAX_FILE="/sys/class/leds/smc::kbd_backlight/max_brightness"

# Adjust brightness
if [[ "$1" == "up" ]]; then
  kbdlight up $STEP
elif [[ "$1" == "down" ]]; then
  kbdlight down $STEP
else
  echo "Usage: $0 [up|down]"
  exit 1
fi

# Get current and max values
current=$(kbdlight get)
max=$(cat $MAX_FILE)

# Calculate percentage safely
if [[ $max -eq 0 ]]; then
  percent=0
else
  percent=$((current * 100 / max))
fi

# Show OSD
swayosd-client --custom-message "Keyboard Backlight: $percent%" --custom-icon "input-keyboard"
