#!/bin/bash

set -e # Exit on error

echo "Configuring Git credential storage..."

# Check if git is installed
if ! command -v git &>/dev/null; then
  echo "✗ Git is not installed. Please install git first."
  exit 1
fi

echo "○ Current git credential configuration:"
git config --global --get credential.helper 2>/dev/null || echo "  No credential helper configured"

# Configure git to store credentials
echo "Setting up credential helper..."
git config --global credential.helper store

echo "✓ Git credential storage configured!"
echo "○ Git will now store credentials in ~/.git-credentials"
echo "⚠ Warning: Credentials are stored in plaintext"
echo ""
echo "To test: run 'git push' and enter your credentials once"