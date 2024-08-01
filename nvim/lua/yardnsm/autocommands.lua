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

-- Unset cursorline && colorcolumn on leave
vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    vim.o.cursorline = false
    vim.o.colorcolumn = "0"
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    vim.o.cursorline = true
    vim.o.colorcolumn = "+0"
  end,
})

-- Automatically set listchars based on expandtab
local update_listchars = function()
  local expandtab = vim.opt_local.expandtab:get()
  local listchars = vim.opt_local.listchars:get()

  if expandtab then
    listchars.tab = "» "
    listchars.lead = " "
  else
    listchars.tab = "  "
    listchars.lead = "·"
  end

  vim.opt_local.listchars = listchars
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*",
  callback = function ()
    update_listchars()
  end
})

vim.api.nvim_create_autocmd({ "OptionSet" }, {
  pattern = "expandtab",
  callback = function ()
    update_listchars()
  end
})
