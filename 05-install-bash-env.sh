#!/bin/bash

set -e # Exit on error

echo "Installing Bash custom configuration..."

ENV_CONFIG="$HOME/.config/bash/environment.sh"
SOURCE_LINE="source $ENV_CONFIG"

# First, stow bash config
echo "Running: stow bash"
if ! stow bash; then
  echo "✗ Failed to stow bash"
  exit 1
fi

if [[ ! -f "$ENV_CONFIG" ]]; then
  echo "✗ $ENV_CONFIG not found after stow"
  exit 1
fi

echo "Adding custom configuration to ~/.bashrc..."
./append-if-not-present.sh "$HOME/.bashrc" "$SOURCE_LINE"
