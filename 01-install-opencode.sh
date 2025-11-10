#!/bin/bash

set -e # Exit on error

# Install opencode using paru
echo "Installing Opencode binary..."
sudo paru -S opencode-bin

echo "Installing Opencode configurations..."
mkdir -p ~/.config/opencode
stow -vv opencode
