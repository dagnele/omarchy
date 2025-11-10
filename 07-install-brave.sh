#!/bin/bash

set -e # Exit on error

echo "Installing Brave Browser..."

if command -v brave &>/dev/null; then
  echo "✓ Brave Browser is already installed ($(brave --version))"
  exit 0
fi

echo "Installing brave-bin from AUR..."
yay -S --noconfirm brave-bin

if command -v brave &>/dev/null; then
  echo "✓ Brave installed successfully!"
  brave --version
else
  echo "✗ Installation failed"
  exit 1
fi
