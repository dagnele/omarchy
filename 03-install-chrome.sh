#!/bin/bash

set -e # Exit on error

echo "Installing Google Chrome..."

if command -v google-chrome-stable &>/dev/null; then
  echo "✓ Google Chrome is already installed ($(google-chrome-stable --version))"
  exit 0
fi

echo "Installing google-chrome from AUR..."
yay -S --noconfirm google-chrome

if command -v google-chrome-stable &>/dev/null; then
  echo "✓ Google Chrome installed successfully!"
  google-chrome-stable --version
else
  echo "✗ Installation failed"
  exit 1
fi
