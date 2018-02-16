#!/usr/bin/env bash

# Updating Homebrew
if cmd_exists 'brew'; then
  execute "brew update" "brew update"
else
  print_status "Homebrew is not installed, can't update"
fi

# Show a message about updating formulae
echo ""
print_status "The following script checks for the availability of homebrew's formulae
       in the system. It does not update them if needed. Therefore,
       some formulae may not be updated. Try running 'brew upgrade' in
       order to update them.
"
print_status "Continue execution in 2 seconds..."
sleep 2
