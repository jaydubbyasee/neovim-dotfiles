require("core.pack")
require("core.keymaps")

-- Mason setup and configuration
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


