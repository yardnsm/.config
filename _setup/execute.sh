#!/bin/bash

# --------------------------------------------- #
# | Dotfile's main setup
# --------------------------------------------- #
print_info "Setting up installation"
source ./_setup/tasks/preinstall.sh

# --------------------------------------------- #
# | Setup shell configurations
# --------------------------------------------- #
print_info "Setup shell configurations"
source ./_setup/tasks/shell.sh

# --------------------------------------------- #
# | Setup the local gitconfig
# --------------------------------------------- #
print_info "Setup Local gitconfig"
source ./_setup/tasks/gitconfig.sh

# --------------------------------------------- #
# | Create symlinks and copies
# --------------------------------------------- #
print_info "Create symlinks and copies"
source ./_setup/tasks/symlink_and_copy.sh

# --------------------------------------------- #
# | Setup workspace
# --------------------------------------------- #
print_info "Setup Workspace"
source ./_setup/tasks/workspace.sh

# --------------------------------------------- #
# | Setup OSX configurations
# --------------------------------------------- #
print_info "Setup OSX configurations"
source ./osx/run_configurations.sh

# --------------------------------------------- #
# | Install Homebrew and Cask
# --------------------------------------------- #
print_info "Install Homebrew and Cask"
source ./osx/homebrew/install_homebrew_cask.sh

# --------------------------------------------- #
# | Install Homebrew dependencies
# --------------------------------------------- #
print_info "Install Homebrew dependencies"
source ./osx/homebrew/install_dependencies.sh

# --------------------------------------------- #
# | Install Applications
# --------------------------------------------- #
print_info "Install Applications"
source ./osx/applications/install_applications.sh

# --------------------------------------------- #
# | Change applications settings
# --------------------------------------------- #
print_info "Change applications settings"
source ./osx/applications/set_applications_settings.sh

# --------------------------------------------- #
# | Run the 'misc' script
# --------------------------------------------- #
print_info "Run miscellaneous"
source ./_setup/tasks/misc.sh

# --------------------------------------------- #
# | Finito
# --------------------------------------------- #
print_info "Clean up..."
source ./_setup/tasks/cleanup.sh

# Say that we've done
print_info_secondary "DONE. Enjoy your new system :)
 Go to '~/dotfiles/_misc' for manuall installs
 Restart your system to see full changes"
