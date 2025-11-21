#!/bin/bash

set -e # Exit on error

echo "Installing yazi (terminal file manager)..."

# Check if yazi is already installed
if command -v yazi &>/dev/null; then
  echo "✓ yazi is already installed ($(yazi --version))"
  exit 0
fi

# Install yazi and optional dependencies
echo "Installing yazi and dependencies..."
sudo pacman -S --needed --noconfirm yazi \
  ffmpegthumbnailer \
  p7zip \
  jq \
  poppler \
  fd \
  ripgrep \
  fzf \
  zoxide

# Verify installation
if command -v yazi &>/dev/null; then
  echo "✓ yazi installed successfully!"
  yazi --version
else
  echo "✗ Installation failed"
  exit 1
fi

# Apply yazi configurations with stow
echo "Applying yazi configurations..."
stow -vv yazi
