This repo contains my reproducible Neovim setup

## Install

Run the following script to clone all external dependencies and setup symlinks

```
bash install.sh
```

## Uninstall

Run the following script to unlink any symlinks created during install

```
bash uninstall.sh
```

## Installed Plugins

### blink.cmp

blink.cmp is a completion plugin with support for LSPs, cmdline, signature help, and snippets. It uses an optional custom fuzzy matcher for typo resistance. It provides extensibility via pluggable sources (LSP, buffer, snippets, etc), component based rendering and dynamic configuration.

### Mason

mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface. It runs everywhere Neovim runs (across Linux, macOS, Windows, etc.), with only a small set of external requirements needed.

### Plenary

Plenary is a foundational Lua library for Neovim that provides a massive collection of reusable utility functions, acting as a dependency for many popular plugins (like Telescope) to reduce code duplication

### Telescope

telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.

### smear-cursor

Neovim plugin to animate the cursor with a smear effect in all terminals. Inspired by Neovide's animated cursor.

### neo-tree

neo-tree.nvim is a file explorer plugin that lets you browse the filesystem and other tree-like structures (buffers, Git status) in a sidebar panel. It supports floating windows, icons, Git integration, and is fully configurable via Lua.

### barbar

barbar is a tab manager

### lualine

lualine is a state of the art status line
