#!/bin/bash

set -e # Exit on error

echo "Installing Tailscale..."

# Check if tailscale is already installed
if command -v tailscale &>/dev/null; then
  echo "✓ Tailscale is already installed ($(tailscale version | head -n1))"
  exit 0
fi

# Install tailscale using yay/paru
if command -v paru &>/dev/null; then
  echo "Installing Tailscale using paru..."
  paru -S --noconfirm tailscale
elif command -v yay &>/dev/null; then
  echo "Installing Tailscale using yay..."
  yay -S --noconfirm tailscale
else
  echo "Installing Tailscale using pacman..."
  sudo pacman -S --needed --noconfirm tailscale
fi

# Enable and start tailscaled service
echo "Enabling tailscaled service..."
sudo systemctl enable --now tailscaled.service

# Verify installation
if command -v tailscale &>/dev/null; then
  echo "✓ Tailscale installed successfully!"
  echo "○ Run 'sudo tailscale up' to connect to your Tailscale network"
  tailscale version | head -n1
else
  echo "✗ Installation failed"
  exit 1
fi
