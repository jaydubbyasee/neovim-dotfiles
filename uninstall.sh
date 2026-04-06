#!/bin/bash
# This script uninstalls the dotfiles for Neovim

# Remove symlinks
TARGET="$(pwd)/nvim"
LINK="$HOME/.config/nvim"
if [ -L "$LINK" ]; then
  rm "$LINK"
fi
