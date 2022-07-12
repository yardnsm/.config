local utils = require("user.utils")

local status_ok, null_ls_sources = pcall(require, "null-ls.sources")
if not status_ok then
  null_ls_sources = nil
end

local allowed_servers = {
  "tsserver",
  "pyright",
  "bashls",
  "sumneko_lua",
  "vimls",
  "jsonls",
}

local get_registered_null_ls_providers = function(filetype)
  if null_ls_sources == nil then
    return {}
  end

  local available_sources = null_ls_sources.get_available(filetype)
  local registered = {}

  for _, source in ipairs(available_sources) do
    table.insert(registered, source.name)
  end

  return registered
end

local M = {}

M.is_client_attahced = function()
  return #vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() }) > 0
end

M.get_servers_names = function()
  local buf_clients = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  local null_ls_providers = get_registered_null_ls_providers(buf_ft)
  vim.list_extend(buf_client_names, null_ls_providers)

  local filtered = {}
  for _, name in pairs(buf_client_names) do
    if utils.has_value(allowed_servers, name) then
      table.insert(filtered, name)
    end
  end

  local remaining = #buf_client_names - #filtered

  return table.concat(filtered, ",") .. (remaining > 0 and (" +" .. remaining) or "")
end

return M
