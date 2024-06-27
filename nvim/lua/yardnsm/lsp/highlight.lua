local augroup = vim.api.nvim_create_augroup("lsp_doc_highlight", { clear = true })

local M = {}

M.setup = function(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      group = augroup,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "WinLeave" }, {
      buffer = bufnr,
      group = augroup,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

return M
