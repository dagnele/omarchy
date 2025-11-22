#!/bin/bash

set -e # Exit on error

echo "Installing wget..."

# Check if wget is already installed
if command -v wget &>/dev/null; then
  echo "✓ wget is already installed ($(wget --version | head -n1))"
  exit 0
fi

# Install wget using pacman
echo "○ Installing wget via pacman..."
sudo pacman -S --needed --noconfirm wget

# Verify installation
if command -v wget &>/dev/null; then
  echo "✓ wget installed successfully!"
  wget --version | head -n1
else
  echo "✗ Installation failed"
  exit 1
fi
