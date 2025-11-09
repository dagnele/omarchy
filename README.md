# Dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

```bash
# Install all components
./run-all-installs.sh

# Or install individually
./00-install-yay.sh            # Install yay (AUR helper)
./01-install-stow.sh           # Install GNU Stow
./01-install-opencode.sh       # Install OpenCode config
./02-install-nvim.sh           # Install Neovim config
./03-install-chrome.sh         # Install Google Chrome
./04-install-android-studio.sh # Install Android Studio
./10-install-hyprland.sh       # Install Hyprland config
```

## Components

### Configurations (managed with Stow)
- **opencode**: OpenCode editor configuration with Chrome DevTools MCP
- **nvim**: Neovim configuration with relative numbers and OpenCode integration
- **hyprland**: Hyprland window manager overrides (GB keyboard layout)

### Applications
- **yay**: AUR helper for installing packages from Arch User Repository
- **Google Chrome**: Web browser
- **Android Studio**: Android development IDE

## How It Works

Each component directory mirrors the structure of `~/.config/`. Running `stow <component>` creates symlinks from this repo to your home directory.

```bash
# Example structure
nvim/.config/nvim/...  →  ~/.config/nvim/...
```

## Manual Usage

```bash
# Apply a configuration
stow -vv nvim

# Remove a configuration
stow -D nvim

# Restow (useful after updates)
stow -R nvim
```

## Utilities

- **append-if-not-present.sh**: Helper script to safely append lines to config files without duplicates

## Requirements

- Arch Linux (scripts use `pacman` and AUR via `yay`)
- Internet connection for downloading packages

## License

See [LICENSE](LICENSE)
