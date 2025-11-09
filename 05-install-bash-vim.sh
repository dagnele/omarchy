#!/bin/bash

set -e # Exit on error

echo "Installing Bash vim mode configuration..."

# Get the absolute path to the vim-mode config
VIM_MODE_CONFIG="$HOME/.config/bash/vim-mode.sh"
SOURCE_LINE="source $VIM_MODE_CONFIG"

# First, stow bash config
echo "Running: stow bash"
if ! stow bash; then
  echo "✗ Failed to stow bash"
  exit 1
fi

# Verify vim-mode.sh exists after stow
if [[ ! -f "$VIM_MODE_CONFIG" ]]; then
  echo "✗ $VIM_MODE_CONFIG not found after stow"
  exit 1
fi

# Add source line to .bashrc
echo "Adding vim mode to ~/.bashrc..."
./append-if-not-present.sh "$HOME/.bashrc" "$SOURCE_LINE"

echo ""
echo "=========================================="
echo "✓ Vim mode installed successfully!"
echo "○ Restart your shell or run: source ~/.bashrc"
echo ""
echo "Vim mode shortcuts:"
echo "  - Press ESC to enter command mode"
echo "  - Press i to enter insert mode"
echo "  - Use h,j,k,l for navigation in command mode"
echo "  - Use / to search history"
