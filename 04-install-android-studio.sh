#!/bin/bash

set -e # Exit on error

echo "Installing Android Studio..."

# Check if android-studio is already installed
if command -v android-studio &>/dev/null; then
  echo "✓ Android Studio is already installed"
  exit 0
fi

# Check if yay is installed (AUR helper required)
if ! command -v yay &>/dev/null; then
  echo "✗ yay is required but not installed"
  echo "○ Please run ./01-install-yay.sh first"
  exit 1
fi

# Install Android Studio from AUR
echo "Installing android-studio from AUR..."
yay -S --noconfirm android-studio

# Verify installation
if command -v android-studio &>/dev/null; then
  echo "✓ Android Studio installed successfully!"
  echo "○ Run 'android-studio' to launch"
else
  echo "✗ Installation failed"
  exit 1
fi
