# Agent Guidelines for Dotfiles Repository

## Repository Overview
This is a dotfiles management repository using GNU Stow for symlinking configuration files to `~/.config/`.

## Commands
- **Install all**: `./run-all-installs.sh` - Runs all numbered install scripts in order
- **Install single component**: `./<NN>-install-<component>.sh` (e.g., `./00-install-yay.sh`)
- **Apply configs with Stow**: `stow -vv <component>` (e.g., `stow -vv nvim`)
- **No tests/build**: This repository has no test suite or build process

## Installation Order
Scripts run in numerical order: 00-yay → 01-stow/opencode → 02-nvim → 03-chrome → 04-android-studio → 10-hyprland. AUR packages (Chrome, Android Studio) require yay to be installed first.

## Code Style Guidelines

### Shell Scripts (Bash)
- **Shebang**: Always start with `#!/bin/bash`
- **Error handling**: Use `set -e` at the top of scripts to exit on error
- **Naming**: Use lowercase with hyphens for script names (e.g., `install-component.sh`). Prefix with numbers for execution order (e.g., `00-install-stow.sh`)
- **Functions**: Use snake_case for function names
- **Variables**: Use UPPERCASE for constants/env vars, lowercase for local vars
- **Quoting**: Always quote variables: `"$variable"`, not `$variable`
- **Conditionals**: Use `[[ ]]` for tests, not `[ ]`
- **Output**: Use emoji prefixes for status: `✓` success, `✗` error, `○` info, `⚠` warning
- **Comments**: Add brief comments explaining non-obvious logic
