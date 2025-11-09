#!/bin/bash

append_lines_if_not_present() {
  local file="$1"
  shift # Remove first argument, rest are lines to add

  touch "$file"

  for line in "$@"; do
    if ! grep -qF "$line" "$file"; then
      echo "$line" >>"$file"
      echo "✓ Added: $line"
    else
      echo "○ Already exists: $line"
    fi
  done
}

# Usage:
# append_lines_if_not_present ~/.bashrc \
#     'source ~/.my_aliases' \
#     'export EDITOR=vim' \
#     'export PATH=$PATH:~/bin'
append_lines_if_not_present "$@"
