#!/bin/bash

set -e # Exit on error

echo "○ Installing OpenJDK 21 (jdk21-openjdk)..."

# Check if OpenJDK 21 is already installed via pacman
if pacman -Qi jdk21-openjdk &>/dev/null; then
  version=$(pacman -Qi jdk21-openjdk | grep -E '^Version' | awk '{print $3}')
  echo "✓ OpenJDK 21 is already installed ($version)"
  exit 0
fi

echo "○ Installing OpenJDK 21 via pacman..."

# Install JDK and JRE 21 packages
sudo pacman -S --needed --noconfirm jdk21-openjdk jre21-openjdk

# Verify installation
if pacman -Qi jdk21-openjdk &>/dev/null; then
  java_version=$(java -version 2>&1 | head -n1)
  echo "✓ OpenJDK 21 installed successfully: $java_version"
else
  echo "✗ Failed to install OpenJDK 21"
  exit 1
fi
