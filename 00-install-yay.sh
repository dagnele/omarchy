#!/bin/bash

set -e # Exit on error

echo "Installing yay (AUR helper)..."

# Check if yay is already installed
if command -v yay &>/dev/null; then
  echo "✓ yay is already installed ($(yay --version | head -n1))"
  exit 0
fi

# Install base-devel and git if not present
echo "Installing prerequisites (base-devel, git)..."
sudo pacman -S --needed --noconfirm base-devel git

# Clone and install yay
echo "Building yay from AUR..."
temp_dir=$(mktemp -d)
cd "$temp_dir"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf "$temp_dir"

# Verify installation
if command -v yay &>/dev/null; then
  echo "✓ yay installed successfully!"
  yay --version | head -n1
else
  echo "✗ Installation failed"
  exit 1
fi
