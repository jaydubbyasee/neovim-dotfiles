print("Loading Rust ftplugin...")

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>a",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { desc = 'Code Action', silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { desc = 'Hover Action', silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>dr",
  function()
    vim.cmd.RustLsp('debuggables')
  end,
  { desc = 'Rust debuggables', silent = true, buffer = bufnr }
)

-- Format on save
local format_group = vim.api.nvim_create_augroup("rust_format_on_save", { clear = false })
vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_group,
  buffer = bufnr,
  callback = function()
    -- Saving still works, unformatted, when rust-analyzer isn't attached
    if #vim.lsp.get_clients({ bufnr = bufnr, name = "rust-analyzer" }) > 0 then
      vim.lsp.buf.format({ bufnr = bufnr, name = "rust-analyzer", timeout_ms = 2000 })
    end
  end,
})
