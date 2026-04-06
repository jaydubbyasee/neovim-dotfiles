#!/bin/bash

# This script synlinks configs needed to setup my Neovim configuration

SCRIPT_ROOT="$(pwd)"

# Symlink configs
TARGET="$SCRIPT_ROOT/nvim"
LINK="$HOME/.config/nvim"
if [ ! -e "$LINK" ]; then
  ln -s "$TARGET" "$LINK" 
fi
