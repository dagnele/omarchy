# Omarchy customization for my mac

Personal Hyprland + Omarchy overrides for my Mac setup. Uses upstream Omarchy defaults and layers local customizations only where needed.

## Structure
- `macbook/.config/hypr/` user override configs (sourced after Omarchy defaults)
- `macbook/.config/hypr/scripts/` small helper scripts (keyboard backlight, lid events)
- Theme files are referenced from `~/.config/omarchy/current/theme/` (not in this repo)

## Key Commands
- Keyboard backlight: XF86KbdBrightnessUp/Down (OSD feedback)
- Lid script auto-disables internal panel when closed

## Development
- Lint scripts: `shellcheck macbook/.config/hypr/scripts/*.sh`
- Follow guidelines in `AGENTS.md` for style, naming, bindings, safety
- Add new bindings in `bindings.conf` with `bindd = SUPER, ...` pattern

## License
MIT
