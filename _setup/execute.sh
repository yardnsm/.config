#!/bin/bash

# --------------------------------------------- #
# | Dotfile's main setup
# --------------------------------------------- #
print_info "Setting up installation"
source ./_setup/misc/preinstall.sh

# --------------------------------------------- #
# | Setup shell configurations
# --------------------------------------------- #
print_info "Setup shell configurations"
source ./_setup/misc/shell.sh

# --------------------------------------------- #
# | Creating symlinks
# --------------------------------------------- #
print_info "Creating symlinks"
source ./_setup/misc/symlink.sh

# --------------------------------------------- #
# | Setting up OSX
# --------------------------------------------- #
print_info "Setup OSX configurations"
source ./osx/run_configurations.sh

# --------------------------------------------- #
# | Installing Homebrew and Cask
# --------------------------------------------- #
print_info "Installing Homebrew and Cask"
source ./osx/homebrew/install_homebrew_cask.sh

# --------------------------------------------- #
# | Installing Homebrew dependencies
# --------------------------------------------- #
print_info "Installing Homebrew dependencies"
source ./osx/homebrew/install_dependencies.sh

# --------------------------------------------- #
# | Installing Applications
# --------------------------------------------- #
print_info "Installing Applications"
source ./osx/applications/install_applications.sh

# --------------------------------------------- #
# | Changing applications settings
# --------------------------------------------- #
print_info "Setting applications settings"
source ./osx/applications/set_applications_settings.sh

# --------------------------------------------- #
# | Run the 'misc' script
# --------------------------------------------- #
print_info "Running miscellaneous"
source ./_setup/misc/misc.sh

# --------------------------------------------- #
# | Finito
# --------------------------------------------- #
print_info "Cleaning up..."
source ./_setup/misc/cleanup.sh

# Say that we done
print_info_secondary "DONE. Enjoy your new system :)
 Go to '~/.dotfiles/_misc' for manuall installs
 It is recommended to restart the system"
