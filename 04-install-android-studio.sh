#!/bin/bash

set -e # Exit on error

echo "Installing Android Studio..."

if command -v android-studio &>/dev/null; then
  echo "✓ Android Studio is already installed"
  exit 0
fi

echo "Installing android-studio from AUR..."
yay -S --noconfirm android-studio

if command -v android-studio &>/dev/null; then
  echo "✓ Android Studio installed successfully!"
  echo "○ Run 'android-studio' to launch"
else
  echo "✗ Installation failed"
  exit 1
fi
