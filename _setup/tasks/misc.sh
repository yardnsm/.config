#!/bin/bash

# --------------------------------------------- #
# | Install NPM Globals
# --------------------------------------------- #
print_info_secondary "Installing NPM global packages"

# Install the packages
npm_install 'bower'
npm_install 'http-server'
npm_install 'gulp'
npm_install 'jade'
npm_install 'nodemon'
npm_install 'speed-test'
