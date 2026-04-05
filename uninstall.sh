#!/bin/bash
# This script uninstalls the dotfiles for Neovim

# Remove symlinks
TARGET="$(pwd)/nvim"
LINK="$HOME/.config/nvim"
if [ -L "$LINK" ]; then
  rm "$LINK"
fi

# Remove symlinks for binary plugins
TARGET="$(pwd)/binary_plugins"
LINK="$HOME/.local/share/nvim/site/pack/bundle/start"
if [ -L "$LINK" ]; then
  rm "$LINK"
fi
