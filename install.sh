#!/bin/bash

# This script downloads binary dependencies and synlinks configs needed to
# setup my Neovim configuration

SCRIPT_ROOT="$(pwd)"
BINARY_PLUGINS_DIR="$(pwd)/binary_plugins"

# Pull git submodules for binary plugins
git submodule update --init --recursive

# Build plugins
# Build blink.cmp
cd "$BINARY_PLUGINS_DIR/blink.cmp"
cargo build --release

# Change back to script root
cd $SCRIPT_ROOT

# Symlink configs
TARGET="$(pwd)/nvim"
LINK="$HOME/.config/nvim"
if [ ! -e "$LINK" ]; then
  ln -s "$TARGET" "$LINK" 
fi

# Symlink binary plugins
TARGET="$(pwd)/binary_plugins"
LINK="$HOME/.local/share/nvim/site/pack/bundle/start"
if [ ! -L "link_name" ]; then
  ln -s "$TARGET" "$LINK"
fi
