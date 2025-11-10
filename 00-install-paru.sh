#!/bin/bash

set -e # Exit on error

echo "Installing paru (AUR helper)..."

# Check if paru is already installed
if command -v paru &>/dev/null; then
  echo "✓ paru is already installed ($(paru --version))"
  exit 0
fi

# Install base-devel and git if not present
echo "Installing prerequisites (base-devel, git)..."
sudo pacman -S --needed --noconfirm base-devel git

# Clone and install paru
echo "Building paru from AUR..."
temp_dir=$(mktemp -d)
cd "$temp_dir"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ~
rm -rf "$temp_dir"

# Verify installation
if command -v paru &>/dev/null; then
  echo "✓ paru installed successfully!"
  paru --version
else
  echo "✗ Installation failed"
  exit 1
fi