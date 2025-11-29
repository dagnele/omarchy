#!/bin/bash

set -e # Exit on error

echo "Installing Android Studio..."

if command -v android-studio &>/dev/null && command -v adb &>/dev/null; then
  echo "✓ Android Studio and android-tools are already installed"
  exit 0
fi

echo "Installing android-studio and android-tools via pacman..."
yay -S --noconfirm android-studio android-tools

if command -v android-studio &>/dev/null && command -v adb &>/dev/null; then
  echo "✓ Android Studio and android-tools installed successfully!"
  echo "○ Run 'android-studio' to launch"
else
  echo "✗ Installation failed"
  exit 1
fi
