#!/bin/bash

# --------------------------------------------- #
# | Common tasks
# --------------------------------------------- #
print_info "Setup shell configurations"
source ./_setup/tasks/common/shell.sh

print_info "Create symlinks"
source ./_setup/tasks/common/symlink.sh

print_info "Create copies"
source ./_setup/tasks/common/copy.sh

print_info "Setup workspace folders"
source ./_setup/tasks/common/workspace.sh

# --------------------------------------------- #
# | Git
# --------------------------------------------- #
print_info "Setup local gitconfig"
source ./_setup/tasks/git/gitconfig.sh

# --------------------------------------------- #
# | OSX
# --------------------------------------------- #
print_info "Setup OSX configurations"
source ./_setup/tasks/osx/run_configurations.sh

print_info "Install Homebrew and Cask"
source ./_setup/tasks/osx/homebrew/install_homebrew.sh

print_info "Install Homebrew dependencies"
source ./_setup/tasks/osx/homebrew/install_dependencies.sh

print_info "Install applications"
source ./_setup/tasks/osx/applications/install_applications.sh

print_info "Change applications settings"
source ./_setup/tasks/osx/applications/set_applications_settings.sh

print_info "Cleaning up"
source ./_setup/tasks/osx/cleanup.sh

# --------------------------------------------- #
# | Node
# --------------------------------------------- #
print_info "Installing NPM global dependencies"
source ./_setup/tasks/node/npm.sh

# --------------------------------------------- #
# | Atom
# --------------------------------------------- #
print_info "Installing Atom packages"
source ./_setup/tasks/atom/apm.sh

# --------------------------------------------- #
# | Done!
# --------------------------------------------- #
print_finish_message
