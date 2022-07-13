local augroup = vim.api.nvim_create_augroup("Config", { clear = true })

-- Unset paste on InsertLeave
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = augroup,
  command = "silent! set nopaste",
})

-- Set signcolumn for buffers that already have numbers on
vim.api.nvim_create_autocmd({ "BufCreate", "BufEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.wo.number then
      vim.opt_local.signcolumn = "yes"
    else
      vim.opt_local.signcolumn = "auto"
    end
  end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "Yanked" })
  end,
})

-- Unset cursorline on leave
vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  command = "set nocursorline",
})

vim.api.nvim_create_autocmd({ "FocusGained", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  command = "set cursorline",
})
