local utils = require("yardnsm.utils")
local augroup = vim.api.nvim_create_augroup("lsp_asthetics", { clear = true })

local M = {}

M.setup = function()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = utils.float_borders_style,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = utils.float_borders_style,
  })

  -- Fix background in :LspInfo and :LspInstallInfo
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lspinfo", "lsp-installer" },
    group = augroup,
    callback = function()
      vim.opt_local.winhl = "Normal:Normal"
    end,
  })

  -- Borders for :LspInfo
  local lspconfig_window = require("lspconfig.ui.windows")
  lspconfig_window.default_options = { border = utils.float_borders_style }
end

return M
