local tab_label = require("yardnsm.misc.tab-label")
local augroup = vim.api.nvim_create_augroup("Diffview", { clear = true })

-- There are some mappings set in ./nvim-tree.lua

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
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
  },

  setup_base46 = function(c, hi)
    hi.DiffviewFilePanelTitle = "NvimTreeRootFolder"
    hi.DiffviewFilePanelConflicts = "NvimTreeRootFolder"
    hi.DiffviewFilePanelCounter = "Comment"
    hi.DiffviewFilePanelFileName = { guifg = c.light_grey }
    hi.DiffviewNormal = "NvimTreeNormal"
    hi.DiffviewWinSeparator = "NvimTreeWinSeparator"
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
        end)
      end,
    })
  end,
}
