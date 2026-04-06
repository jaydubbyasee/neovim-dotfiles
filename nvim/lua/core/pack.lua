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
    end
  end
})


vim.pack.add({
  { src = "https://github.com/rebelot/kanagawa.nvim.git" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  -- Dependency for telescope
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim"},
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
  -- Dependency for neo-tree
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
})
