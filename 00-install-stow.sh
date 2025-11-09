#!/bin/bash

set -e # Exit on error

echo "Installing GNU Stow..."

# Check if stow is already installed
if command -v stow &>/dev/null; then
  echo "✓ GNU Stow is already installed ($(stow --version | head -n1))"
  exit 0
fi

# Install via pacman
echo "Installing stow via pacman..."
sudo pacman -S --noconfirm stow

# Verify installation
echo "✓ GNU Stow installed successfully!"
stow --version | head -n1
