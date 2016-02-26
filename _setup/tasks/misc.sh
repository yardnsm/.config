#!/bin/bash

# --------------------------------------------- #
# | Install NPM Global Packages
# --------------------------------------------- #
print_info_secondary "Install NPM Global Packages"

# Install the packages
npm_install 'bower'
npm_install 'http-server'
npm_install 'gulp'
npm_install 'jade'
npm_install 'nodemon'
npm_install 'speed-test'

# --------------------------------------------- #
# | Installing Atom's packages
# --------------------------------------------- #
print_info_secondary "Installing Atom's packages"
execute 'apm install package-sync' \
'package-sync is now installed. Open Atom, press cmd+shift+p and type "sync"'
