local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  return
end

local tab_label = require("yardnsm.misc.tab-label")

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "DiffviewFiles",
  group = augroup,
  callback = function()
    vim.schedule(function ()
      -- Peoperly set winhl
      vim.opt_local.winhl:append('Normal:DiffviewNormal')

      -- Set a tab label
      tab_label.set_label_for_tab(nil, "Diffview")
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "DiffviewFileHistory",
  group = augroup,
  callback = function()
    vim.schedule(function ()
      -- Set a tab label
      tab_label.set_label_for_tab(nil, "Diffview History")
    end)
  end,
})

-- There are some mappings set in ./nvim-tree.lua
