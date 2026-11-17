-- This file contains plugins that we want vim.pack to install

-- Example implementation for a plugin needing cargo build
vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "*",
  callback = function(ev)
    print("PackChanged event triggered for plugin: " .. ev.data.spec.name .. " with action: " .. ev.data.kind)
    -- Check if the plugin being updated is 'blink.cmp'
    if ev.data.spec.name == "blink.cmp" and
      (ev.data.kind == "install" or ev.data.kind == "update") then

      print("Running cargo build for blink.cmp...")
      local plugin_path = ev.data.path
      vim.system({"cargo", "build", "--release"}, { cwd = plugin_path }):wait()
    elseif ev.data.spec.name == "nvim-treesitter" and
      (ev.data.kind == "install" or ev.data.kind == "update") then

      print("Running :TSUpdate for nvim-treesitter.nvim...")
      vim.api.nvim_command('TSUpdate') -- This will trigger the Treesitter update process
    end
  end
})


vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim.git" },
  -- mason moved to the mason-org GitHub organization
  { src = "https://github.com/mason-org/mason.nvim", version = vim.version.range('2') },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim", version = vim.version.range('2') },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  -- Dependency for telescope
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range('0.2') },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range('1') },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
  -- Dependency for neo-tree
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  { src = "https://github.com/nvim-lualine/lualine.nvim", },
  -- Dependencies for barbar (nvim-web-devicons is added above)
  { src = "https://github.com/lewis6991/gitsigns.nvim", version = vim.version.range('2') },
  { src = "https://github.com/romgrk/barbar.nvim" },
  -- Treesitter and related plugins
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main"
  },
  -- Rust-specific plugins
  {
    src = 'https://github.com/mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = vim.version.range('^9')
  },
  -- Cargo.toml crate versions, features and completions
  { src = "https://github.com/saecki/crates.nvim", version = vim.version.range('0.7') },
  -- Dap and related plugins
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  -- nvim-dap moved to codeberg
  { src = "https://codeberg.org/mfussenegger/nvim-dap" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/folke/lazydev.nvim" },
})
