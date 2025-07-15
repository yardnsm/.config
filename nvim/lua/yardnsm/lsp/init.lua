local asthetics = require("yardnsm.lsp.asthetics")
local commands = require("yardnsm.lsp.commands")
local diagnostics = require("yardnsm.lsp.diagnostics")
local keymaps = require("yardnsm.lsp.keymaps")
local plugins = require("yardnsm.lsp.plugins")
local rename = require("yardnsm.lsp.rename")

local M = {}

-- List of servers to use, will be installed via mason-lspconfig
M.required_servers = {
  "bashls",
  "pyright",
  "lua_ls",
  -- "tsserver",
  "vtsls",
  "vimls",
  "tailwindcss",
  "cssls",
  -- "graphql",
  -- "intelephense",
  "jsonls",
  "eslint",
  -- "nxls",
}

-- Disable formatting for certains servers; let null-ls do its thing!
M.disable_formatting_on_servers = {
  "tsserver",
  "vtsls",
  "lua_ls",
}

---@param client vim.lsp.Client
---@param bufnr number
M.on_attach = function(client, bufnr)
  -- Disable formatting if necessary
  if vim.tbl_contains(M.disable_formatting_on_servers, client.name) then
    client.server_capabilities.documentFormattingProvider = false
  end

  keymaps.setup_buffer(bufnr)
  plugins.setup_buffer(client, bufnr)
end

local make_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- Setup nvim-cmp, if installed
  local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if cmp_status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
  end

  -- Setup blink.nvim, if installed
  local blink_status_ok, blink_lsp = pcall(require, "blink.cmp")
  if blink_status_ok then
    capabilities = blink_lsp.get_lsp_capabilities(capabilities)
  end

  capabilities.workspace = capabilities.workspace or {}
  capabilities.workspace.executeCommand = {
    dynamicRegistration = true,
  }

  return capabilities
end

M.setup = function()
  diagnostics.setup()
  commands.setup()
  rename.setup()
  asthetics.setup()
  keymaps.setup()

  vim.lsp.config("*", {
    on_attach = M.on_attach,
    capabilities = make_capabilities(),
  })
end

return M
