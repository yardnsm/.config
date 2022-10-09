local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("Diffview", { clear = true })

diffview.setup({
  use_icons = true,
  icons = {
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
})

-- Peoperly set winhl
vim.api.nvim_create_autocmd("FileType", {
  pattern = "DiffviewFiles",
  group = augroup,
  callback = function()
    vim.schedule(function ()
      vim.opt_local.winhl:append('Normal:DiffviewNormal')
    end)
  end,
})

-- There are some mappings set in ./nvim-tree.lua
