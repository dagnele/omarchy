# Dotfiles

Personal configuration files for Arch Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start

```bash
# Install everything in order
./run-all-installs.sh

# Or run individual scripts (use ls [0-9][0-9]-install-*.sh to see all)
./00-install-<component>.sh
./01-install-<component>.sh
# ... etc
```

**Note**: Install scripts are numbered to control execution order. Scripts starting with `00-` are prerequisites (package managers, stow) and must run first.

## How It Works

This repository uses two main concepts:

### 1. Install Scripts (`NN-install-*.sh`)
Numbered shell scripts that:
- Install applications (via `pacman`, AUR helpers, or other methods)
- Apply configurations using Stow
- Perform any additional setup

The `run-all-installs.sh` script executes all `[0-9][0-9]-install-*.sh` scripts in numerical order.

### 2. Stow Packages (directories)
Each directory contains config files that mirror `~/.config/` structure. When you run `stow <directory>`, it creates symlinks:

```bash
# Example
nvim/.config/nvim/init.lua  →  ~/.config/nvim/init.lua
tmux/.config/tmux/tmux.conf →  ~/.config/tmux/tmux.conf
```

## Repository Structure

```
├── <component>/            # Stow packages (configs)
│   └── .config/
│       └── <component>/
├── NN-install-*.sh         # Numbered install scripts
├── run-all-installs.sh     # Master installer
└── append-if-not-present.sh # Utility script
```

## Manual Usage

### Using Install Scripts
```bash
# List all install scripts
ls [0-9][0-9]-install-*.sh

# Run a specific script
./02-install-nvim.sh
```

### Using Stow Directly
```bash
# List all stow packages
ls -d */

# Apply a configuration
stow -vv <component>

# Remove a configuration
stow -D <component>

# Restow (useful after updates)
stow -R <component>
```

Most install scripts handle stowing automatically, but you can manage configs manually if needed.

## Utilities

- **append-if-not-present.sh**: Safely appends lines to config files without creating duplicates

## Manual Steps

These are system configuration changes that were performed manually and are not automated by the install scripts:

### DNSSEC
DNSSEC has been disabled on this system.

```bash
# To disable DNSSEC (if needed on other systems)
sudo systemctl edit systemd-resolved.conf
# Add: DNSSEC=no
sudo systemctl restart systemd-resolved
```

### NTP Configuration
NTP (Network Time Protocol) configuration was updated in `/etc/systemd/timesyncd.conf`.

```bash
# Edit the configuration file
sudo nano /etc/systemd/timesyncd.conf

# Add the following under [Time] section:
[Time]
NTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org
FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org

# Restart the service
sudo systemctl restart systemd-timesyncd

# Verify time sync status
timedatectl status
```

**Note**: This was an unusual requirement for Arch Linux, which typically works with default NTP settings.

## Requirements

- Arch Linux
- Internet connection
- `sudo` privileges for package installation

## License

See [LICENSE](LICENSE)
