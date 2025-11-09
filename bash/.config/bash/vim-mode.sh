# Bash vim mode configuration
# Enable vi mode in bash
set -o vi

# Use bind to set up the prompt indicator
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string ""'
bind 'set vi-cmd-mode-string "\1\e[34m\2●\1\e[0m\2 "' # dot
