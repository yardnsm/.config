local M = {}
local augroup = vim.api.nvim_create_augroup("lsp_plugins", { clear = true })

local function lsp_plugin_navic(client, bufnr)
  if client.supports_method("textDocument/documentSymbol") then
    local status_ok, navic = pcall(require, "nvim-navic")
    if status_ok then
      navic.attach(client, bufnr)
    end
  end
end

local function lsp_plugin_lightbulb(bufnr)
  local status_ok, ligthbulb = pcall(require, "nvim-lightbulb")
  if status_ok then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      group = augroup,
      callback = function()
        ligthbulb.update_lightbulb()
      end,
    })
  end
end

M.setup_buffer = function(client, bufnr)
  lsp_plugin_navic(client, bufnr)
  lsp_plugin_lightbulb(bufnr)
end

return M
