#!/bin/bash

set -e # Exit on error

echo "Installing Opencode configurations..."
mkdir -p ~/.config/opencode
stow -vv opencode
