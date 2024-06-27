local tab_label = require("yardnsm.misc.tab-label")
local augroup = vim.api.nvim_create_augroup("Diffview", { clear = true })

-- There are some mappings set in ./nvim-tree.lua

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    enhanced_diff_hl = true,
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

    hooks = {
      diff_buf_read = function()
        vim.opt_local.relativenumber = false
      end,
    },
  },

  ---@type Base46Handler
  setup_base46 = function(c, hi)
    hi.DiffviewFilePanelTitle = "NvimTreeRootFolder"
    hi.DiffviewFilePanelConflicts = "NvimTreeRootFolder"
    hi.DiffviewFilePanelCounter = "Comment"
    hi.DiffviewFilePanelFileName = { guifg = c.light_grey }
    hi.DiffviewFilePanelSelected = { guifg = c.folder_bg }
    hi.DiffviewNormal = "NvimTreeNormal"
    hi.DiffviewWinSeparator = { guifg = c.darker_black, guibg = c.darker_black }

    local util = require("nvim-base46.util")

    hi.DiffAdd = { guibg = util.darken(c.vibrant_green, 0.15) }
    hi.DiffChange = { guibg = util.darken(c.blue, 0.15) }
    hi.DiffDelete = { guibg = util.darken(c.red, 0.15) }
    hi.DiffText = { guibg = util.darken(c.blue, 0.25) }
  end,

  config = function(_, opts)
    require("diffview").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "DiffviewFiles",
      group = augroup,
      callback = function()
        vim.schedule(function()
          -- Properly set winhl
          vim.opt_local.winhl:append("Normal:DiffviewNormal")

          -- Set a tab label
          tab_label.set_label_for_tab(nil, "Diffview")
        end)
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "DiffviewFileHistory",
      group = augroup,
      callback = function()
        vim.schedule(function()
          -- Set a tab label
          tab_label.set_label_for_tab(nil, "Diffview History")

          -- A trick to hide colorcolumn from the history pane
          vim.opt_local.winhl:append("ColorColumn:")
        end)
      end,
    })
  end,
}
