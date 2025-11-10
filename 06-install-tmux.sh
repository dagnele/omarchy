#!/bin/bash

set -e # Exit on error

echo "Installing Tmux configurations..."
mkdir -p ~/.config/tmux
stow -vv tmux

echo "Installing Tmux Plugin Manager (TPM)..."
if [[ -d ~/.tmux/plugins/tpm ]]; then
  echo "✓ TPM already exists"
else
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Installing Tmux..."

# Check if tmux is already installed
if command -v tmux &>/dev/null; then
  echo "✓ Tmux is already installed"
  exit 0
fi

echo "Installing Tmux from official repositories..."
sudo pacman -S --noconfirm tmux

if command -v tmux &>/dev/null; then
  echo "✓ Tmux installed successfully!"
  echo "○ Run 'tmux' to launch"
else
  echo "✗ Installation failed"
  exit 1
fi
