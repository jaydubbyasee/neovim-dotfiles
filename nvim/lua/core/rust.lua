-- rustaceanvim configuration. Must be loaded before the plugin itself.

-- Prefer rustup's rust-analyzer, which matches the compiler. Mason prepends its
-- own bin directory to PATH, so looking it up by name could find Mason's copy.
local cargo_home = vim.env.CARGO_HOME or vim.fs.joinpath(vim.env.HOME, ".cargo")
local rustup_analyzer = vim.fs.joinpath(cargo_home, "bin", "rust-analyzer")

-- lldb-dap from PATH, falling back to the one in Apple's command line tools
local function find_lldb_dap()
  local path = vim.fn.exepath("lldb-dap")
  if path == "" and vim.fn.executable("xcrun") == 1 then
    local result = vim.system({ "xcrun", "-f", "lldb-dap" }, { text = true }):wait()
    path = result.code == 0 and vim.trim(result.stdout) or ""
  end
  return path
end

vim.g.rustaceanvim = {
  server = {
    cmd = function()
      local cmd = vim.fn.executable(rustup_analyzer) == 1 and rustup_analyzer or "rust-analyzer"
      return { cmd, "--log-file", require("rustaceanvim.config.internal").server.logfile }
    end,
  },
  dap = {
    -- Mason's codelldb 1.12.1 crashes on launch on macOS 27, so use lldb-dap
    adapter = function()
      local command = find_lldb_dap()
      if command == "" then
        return false
      end
      return { type = "executable", command = command, name = "lldb" }
    end,
  },
}
