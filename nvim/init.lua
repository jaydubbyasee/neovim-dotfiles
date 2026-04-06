require("core.pack")
require("core.keymaps")
require("core.appearance")

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

-- nvim-smear-cursor setup
require('smear_cursor').setup({
  -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears and particles will look a lot less blocky.
    legacy_computing_symbols_support = false,

    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = true,
})

-- Neo-tree setup
require('neo-tree').setup({
  -- options go here
})

-- Lua-Line setup
require('lualine').setup()

-- Gitsigns
require('gitsigns').setup({
  current_line_blame = true, -- Toggle globally on startup
})
