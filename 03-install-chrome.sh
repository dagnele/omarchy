#!/bin/bash

set -e # Exit on error

echo "Installing Google Chrome..."

# Check if google-chrome is already installed
if command -v google-chrome-stable &>/dev/null; then
  echo "✓ Google Chrome is already installed ($(google-chrome-stable --version))"
  exit 0
fi

# Check if yay is installed (AUR helper required)
if ! command -v yay &>/dev/null; then
  echo "✗ yay is required but not installed"
  echo "○ Please run ./00-install-yay.sh first"
  exit 1
fi

# Install Google Chrome from AUR
echo "Installing google-chrome from AUR..."
yay -S --noconfirm google-chrome

# Verify installation
if command -v google-chrome-stable &>/dev/null; then
  echo "✓ Google Chrome installed successfully!"
  google-chrome-stable --version
else
  echo "✗ Installation failed"
  exit 1
fi
