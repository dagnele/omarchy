#!/bin/bash

# Check lid state
state=$(cat /proc/acpi/button/lid/LID0/state)

if [[ "$state" == *"closed"* ]]; then
  # Lid closed → disable laptop screen
  hyprctl keyword monitor "eDP-1,disable"
else
  # Lid open → re-enable laptop screen
  hyprctl keyword monitor "eDP-1,2560x1600@59.97,3440x0,2"
fi
