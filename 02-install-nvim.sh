#!/bin/bash

set -e # Exit on error

echo "Installing Neovim configurations..."
mkdir -p ~/.config/nvim
stow -vv nvim

# Install lsof required by the opencode plugin i am using
echo "Installing lsof..."
sudo pacman -Sy lsof

