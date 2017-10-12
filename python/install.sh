#!/usr/bin/env bash

# ---------------------------------------------

print_info "Installing pips"

pip_install 'yapf'
pip_install 'flake8'
pip_install 'jedi'
pip_install 'neovim'
pip_install 'pypcap'

pip_install 'scapy'
pip_install 'pyx'
