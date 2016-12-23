#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Installing NPM global dependencies"

# Dev stuff
npm_install 'bower'
npm_install 'http-server'
npm_install 'gulp'
npm_install 'jade'
npm_install 'nodemon'
npm_install 'json-server'
npm_install 'eslint'
npm_install 'yo'
npm_install 'xo'
npm_install 'npm-upgrade'
npm_install 'trymodule'
npm_install 'babel-cli'
npm_install 'webpack'
npm_install 'np'
npm_install 'yarn'
npm_install 'pnpm'

# Misc
npm_install 'speed-test'
npm_install 'fast-cli'
npm_install 'emoj'
