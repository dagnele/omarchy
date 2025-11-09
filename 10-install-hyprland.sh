#!/bin/bash

# Source the append_if_not_present function
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Hypr configuration override installer
HYPR_CONFIG="$HOME/.config/hypr/hyprland.conf"
OVERRIDES_CONFIG="$HOME/.config/hypr/overrides.conf"
SOURCE_LINE='source = ~/.config/hypr/overrides.conf'

echo "Installing Hypr overrides configuration..."
echo "=========================================="

# First, stow hyprland
echo "Running: stow hyprland"
if ! stow hyprland; then
  echo "✗ Failed to stow hyprland"
  exit 1
fi

# Check if config directory exists after stow
if [ ! -d "$(dirname "$HYPR_CONFIG")" ]; then
  echo "✗ Config directory not found after stow"
  exit 1
fi

# Check if overrides.conf exists after stow
if [ ! -f "$OVERRIDES_CONFIG" ]; then
  echo "✗ $OVERRIDES_CONFIG not found after stow"
  exit 1
fi

# Use the generic function to add the source line
. ./append-if-not-present.sh "$HYPR_CONFIG" "$SOURCE_LINE"

echo ""
echo "=========================================="
echo "Installation complete!"
echo ""
echo "You can now add your custom Hyprland configuration to:"
echo "  $OVERRIDES_CONFIG"
