#!/bin/bash
# Directory containing the install scripts (default: current directory)
SCRIPT_DIR="${1:-.}"

# Change to the script directory
cd "$SCRIPT_DIR" || exit 1

echo "Looking for install-* scripts in: $(pwd)"
echo "=========================================="

# Find and run all install-* scripts in sorted order
found=0
for script in $(find . -maxdepth 1 -name '[0-9][0-9]-install-*' -type f | sort); do
  script=$(basename "$script")

  # Check if it's executable
  if [ -x "$script" ]; then
    found=1
    echo ""
    echo "Running: $script"
    echo "----------------------------------------"

    # Run the script
    if ./"$script"; then
      echo "✓ $script completed successfully"
    else
      echo "✗ $script failed with exit code $?"
      # Uncomment the next line if you want to stop on first failure
      # exit 1
    fi
  else
    echo "⚠ Skipping $script (not executable)"
  fi
done

if [ $found -eq 0 ]; then
  echo "No executable install-* scripts found"
  exit 0
fi

echo ""
echo "=========================================="
echo "All install scripts completed"
