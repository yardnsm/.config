local M = {}

M.setup = function()
  -- Disable the default mappings (:h lsp-defaults-disable)
  vim.keymap.del("n", "grn")
  vim.keymap.del("n", "gra")
  vim.keymap.del("n", "grr")
  vim.keymap.del("i", "<C-s>")
end

M.setup_buffer = function(bufnr)
  local opts = { noremap = true, silent = true }

  -- Jumps
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions theme=ivy<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", ":Telescope lsp_type_definitions theme=ivy<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":Telescope lsp_implementations theme=ivy<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references theme=ivy show_line=false<CR>", opts)

  -- Docs
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Actions
  -- <leader>l for [l]anguage
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>Format<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>la",
    "<cmd>lua require('telescope'); vim.lsp.buf.code_action()<CR>",
    opts
  )

  -- Diagnostics
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lg", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

return M
