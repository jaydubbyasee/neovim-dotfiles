-- This file contains keymaps that we want to set on startup

-- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 300

-- Set the leader key to space
vim.g.mapleader = " "

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- Pressing 'ev' (Edit Vimrc) opens your config in a new vertical split
vim.keymap.set('n', '<leader>ev', '<cmd>vsplit $MYVIMRC<CR>', { desc = 'Open init.lua' })

-- Pressing 'sv' (Source Vimrc) reloads the config immediately
vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', { desc = 'Reload init.lua' })

-- NeoTree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle NeoTree' })

-- Buffer splits
vim.keymap.set('n', '<leader>bs', '<cmd>vsplit<cr>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>bh', '<cmd>split<cr>', { desc = 'Horizontal Split' })

-- Open Terminal
vim.keymap.set('n', '<leader>t', '<cmd>terminal<cr>', { desc = 'Open Terminal' })

-- Git signs
vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns blame<cr>', { desc = 'Toggle git blame' })
