#!/bin/bash

set -e # Exit on error

echo "Installing Opencode configurations..."
mkdir -p ~/.config/opencode
stow -vv opencode

if command -v opencode &>/dev/null; then
  echo "✓ opencode is already installed ($(opencode --version | head -n1))"
  exit 0
fi

# Install opencode using paru
echo "Installing Opencode binary..."
paru -S opencode-bin
