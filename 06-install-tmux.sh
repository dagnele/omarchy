#!/bin/bash

set -e # Exit on error

echo "Installing Tmux configurations..."
mkdir -p ~/.config/tmux
stow -vv tmux

echo "Installing Tmux Plugin Manager (TPM)..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing Tmux..."

# Check if tmux is already installed
if command -v tmux &>/dev/null; then
  echo "✓ Tmux is already installed"
  exit 0
fi

# Check if yay is installed (AUR helper required)
if ! command -v yay &>/dev/null; then
  echo "✗ yay is required but not installed"
  echo "○ Please run ./00-install-yay.sh first"
  exit 1
fi

# Install Tmux from official repositories
echo "Installing Tmux from official repositories..."
pacman -S --noconfirm tmux

# Verify installation
if command -v tmux &>/dev/null; then
  echo "✓ Tmux installed successfully!"
  echo "○ Run 'tmux' to launch"
else
  echo "✗ Installation failed"
  exit 1
fi
