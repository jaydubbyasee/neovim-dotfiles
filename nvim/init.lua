require("core.rust")
require("core.pack")
require("core.keymaps")
require("core.appearance")

-- Mason setup and configuration
require("mason").setup()
require("mason-lspconfig").setup({
  -- mason-lspconfig v2 calls vim.lsp.enable() for every installed server.
  -- rustaceanvim manages rust-analyzer itself, so starting it here too would
  -- attach two rust-analyzer clients to every Rust buffer.
  automatic_enable = {
    exclude = { "rust_analyzer" },
  },
})

-- Ensure blink.cmp is initialized
require('blink.cmp').setup({
  -- 'default' for vibrant icons, 'mono' for a cleaner look
  appearance = {
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

-- which-key: popup showing the keymaps available after the keys typed so far
local which_key = require('which-key')
which_key.setup({
  preset = 'modern',
  -- Popup delay (ms)
  delay = 300,
})

-- Names for the leader key groups (individual mappings use their own `desc`)
which_key.add({
  { '<leader>b', group = 'Buffer splits' },
  { '<leader>d', group = 'Debug' },
  { '<leader>e', group = 'Explorer / Edit config' },
  { '<leader>f', group = 'Find' },
  { '<leader>g', group = 'Git' },
  { '<leader>q', group = 'Quit' },
  { '<leader>s', group = 'Source config' },
  { '<leader>w', group = 'Write' },
})

-- Gitsigns
require('gitsigns').setup({
  current_line_blame = true, -- Toggle globally on startup
})

--- Treesitter setup
require('nvim-treesitter').install { 'rust', 'toml', 'python', 'lua', 'javascript', 'typescript' }

-- The nvim-treesitter main branch no longer enables highlighting itself
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- crates.nvim: versions, features and completion in Cargo.toml (served over LSP so blink.cmp picks it up)
require('crates').setup({
  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
})

-- Setup dap and dap-ui
require("dapui").setup()

require("lazydev").setup({
  library = { "nvim-dap-ui" },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end