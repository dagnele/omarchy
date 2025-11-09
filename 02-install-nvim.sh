#!/bin/bash

set -e # Exit on error

echo "Installing Neovim configurations..."
stow -vv nvim
