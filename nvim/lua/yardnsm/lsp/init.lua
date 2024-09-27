local asthetics = require("yardnsm.lsp.asthetics")
local commands = require("yardnsm.lsp.commands")
local diagnostics = require("yardnsm.lsp.diagnostics")
local highlight = require("yardnsm.lsp.highlight")
local keymaps = require("yardnsm.lsp.keymaps")
local plugins = require("yardnsm.lsp.plugins")
local rename = require("yardnsm.lsp.rename")

local M = {}

-- List of servers to use, will be installed via mason-lspconfig
M.required_servers = {
  "bashls",
  "pyright",
  "lua_ls",
  "tsserver",
  "vimls",
  "tailwindcss",
  "cssls",
  "graphql",
  "intelephense",
  "jsonls",
  "eslint",
  "nxls",
}

-- Disable formatting for certains servers; let null-ls do its thing!
M.disable_formatting_on_servers = {
  "tsserver",
  "sumneko_lua",
}

---@param client vim.lsp.Client
---@param bufnr number
M.on_attach = function(client, bufnr)
  -- Disable formatting if necessary
  if vim.tbl_contains(M.disable_formatting_on_servers, client.name) then
    client.server_capabilities.document_formatting = false
  end

  keymaps.setup_buffer(bufnr)
  highlight.setup_buffer(client, bufnr)
  plugins.setup_buffer(client, bufnr)
end

M.make_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
  end

  return capabilities
end

M.setup_handler = function(server_name)
  local lspconfig = require("lspconfig")
  local capabilities = M.make_capabilities()

  local server_opts = {
    on_attach = M.on_attach,
    capabilities = capabilities,
  }

  local lsp_options_status_ok, lsp_options = pcall(require, "yardnsm.lsp.settings." .. server_name)
  if lsp_options_status_ok then
    server_opts = vim.tbl_deep_extend("force", lsp_options, server_opts)

    --- Do not allow overriding on_attach
    if lsp_options.on_attach ~= nil then
      server_opts.on_attach = function(...)
        M.on_attach(...)
        lsp_options.on_attach(...)
      end
    end
  end

  lspconfig[server_name].setup(server_opts)
end

M.setup = function()
  diagnostics.setup()
  commands.setup()
  rename.setup()
  asthetics.setup()
  keymaps.setup()
end

return M
