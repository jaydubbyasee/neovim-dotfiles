#!/bin/bash

# This script synlinks configs needed to setup my Neovim configuration

SCRIPT_ROOT="$(pwd)"

# Install tree-sitter CLI globally if not already installed
if ! command -v tree-sitter &> /dev/null; then
  echo "tree-sitter CLI not found, installing globally..."
  cargo install --locked tree-sitter-cli
else
  echo "tree-sitter CLI is already installed."
fi

# Symlink configs
TARGET="$SCRIPT_ROOT/nvim"
LINK="$HOME/.config/nvim"
if [ ! -e "$LINK" ]; then
  ln -s "$TARGET" "$LINK" 
fi
