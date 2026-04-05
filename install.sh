#!/bin/bash

# Pull git submodules for binary plugins
git submodule update --init --recursive

# Symlink configs
ln -s "$(pwd)/nvim" ~/.config/nvim

# Symlink binary plugins
ln -s "$(pwd)/binary_plugins" ~/.local/share/nvim/site/pack/bundle/start
