require("core.pack")
require("core.keymaps")

-- 2. Standard Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({
})

-- Ensure blink.cmp is initialized
require('blink.cmp').setup({
  -- 'default' for vibrant icons, 'mono' for a cleaner look
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  -- Configure keymaps (this uses the 'default' preset)
  keymap = { preset = 'default' },

  -- Define sources for completion
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- Optional: Experimental signature help support
  signature = { enabled = true }
})

-- Keybindings

-- Pressing 'ev' (Edit Vimrc) opens your config in a new vertical split
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', { desc = 'Open init.lua' })

-- Pressing 'sv' (Source Vimrc) reloads the config immediately
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', { desc = 'Reload init.lua' })
