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
if [ -L "$LINK" ] && [ "$(readlink "$LINK")" = "$TARGET" ]; then
  echo "$LINK already points to $TARGET."
else
  # Back up whatever config is already there instead of silently skipping
  if [ -e "$LINK" ] || [ -L "$LINK" ]; then
    BACKUP="$LINK.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing $LINK to $BACKUP"
    mv "$LINK" "$BACKUP"
  fi
  mkdir -p "$(dirname "$LINK")"
  ln -s "$TARGET" "$LINK"
  echo "Linked $LINK -> $TARGET"
fi
