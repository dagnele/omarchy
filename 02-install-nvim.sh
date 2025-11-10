#!/bin/bash

set -e # Exit on error

echo "Installing Neovim configurations..."
mkdir -p ~/.config/nvim
stow -vv nvim
