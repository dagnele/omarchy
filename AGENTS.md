AGENTS GUIDELINES

1. Project type: dotfiles / Hyprland + Omarchy customization (shell + conf). No build system; no tests present. If tests added later: run with `pytest -k <name>` for Python, or `npm test -- <pattern>` if Node introduced.
2. Build/lint: shellcheck all scripts: `shellcheck macbook/.config/hypr/scripts/*.sh`. Keep scripts POSIX/Bash compatible (shebang `#!/bin/bash`). Avoid bashisms if portability desired.
3. Script style: set `set -euo pipefail` (add `IFS=$'\n\t'`) at top unless interactive. Use lowercase for local vars, UPPER for constants (e.g. STEP). Quote all variable expansions, prefer `"${var}"`.
4. Imports/includes: Hypr config composes via `source` lines; append new sources after existing default block; never edit defaults under `~/.local/share/omarchy/default/` from this repo.
5. Naming: hypr config variables/use kebab-case for custom scripts, functions snake_case inside scripts. Keep file names descriptive: action-target.sh.
6. Error handling: validate external commands (check with `command -v`); exit non-zero on failure; provide helpful stderr messages.
7. Security: never execute untrusted input; when constructing commands use arrays; avoid word splitting; prefer explicit paths for tools like `hyprctl`.
8. Configuration overrides: only modify user override files in `macbook/.config/hypr/*.conf`; do not duplicate defaults; keep comments explaining rationale.
9. Performance: keep scripts short-lived; avoid subshell loops; cache expensive calls when possible (e.g., reading max brightness once).
10. Adding new key bindings: use `bindd = SUPER, <KEY>, <Label>, exec, <command>` matching existing pattern; comment unusual bindings.
11. Colors/themes: rely on `~/.config/omarchy/current/theme/*`; do not hardcode colors inside this repo unless necessary.
12. Encoding/formatting: UTF-8; end files with newline; 2 spaces indent inside Hypr config blocks; shell scripts indent 2 spaces.
13. Comments: start with capital, explain why not what if non-obvious; reference upstream wiki when relevant.
14. Logging/user feedback: use concise echo messages; for OSD use swayosd-client like existing script pattern.
15. Future tests: if adding tests for scripts, place under `tests/` and ensure they run in CI with shellcheck.
16. License: MIT; keep headers intact when copying scripts.
17. Git hygiene: small commits, imperative messages (e.g., "add lid close monitor toggle").
18. Do not introduce secrets; parametrize via env vars documented in envs.conf comments.
19. Keep line length < 120 chars for readability.
20. Agents should validate changes by running shellcheck and (if applicable) executing scripts with dry-run flags before committing.
