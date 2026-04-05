-- This file contains plugins that we want vim.pack to install
vim.pack.add({
  { src = "https://github.com/williamboman/mason.nvim.git" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  -- Dependency for telescope
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git"},
})
