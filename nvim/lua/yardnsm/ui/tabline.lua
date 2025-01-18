local Line = require("yardnsm.ui.line")
local blocks = require("yardnsm.ui.blocks")
local utils = require("yardnsm.utils")
local tab_label = require("yardnsm.misc.tab-label")
local base46_utils = require("yardnsm.misc.base46-utils")

-- I don't use tabs that much, and having a line at the top that shows my open buffers seems
-- redundant. When I *do* use tabs, the default tabline is a mess. Hence -- this minimal tabline!

-- Setup highlights
base46_utils.attach_handler(function(c, hi)
  hi.Tb_Reset = { fg = c.white, bg = c.black }
  hi.Tb_TabActive = "TabLineSel"
  hi.Tb_TabInactive = { fg = c.grey_fg, bg = "NONE" }
end)

Line.setup({
  option = "tabline",
  renderers = {
    {
      enabled = true,
      render = function()
        local active_tab = vim.fn.tabpagenr()
        local num_tabs = vim.fn.tabpagenr("$")

        local tabs = {}

        for tabpagenr = 1, num_tabs do
          local is_active = active_tab == tabpagenr
          local label = tab_label.get_label_for_tab(tabpagenr)
          local tab_curr_win_ft = vim.api.nvim_get_option_value("ft", {
            buf = vim.fn.winbufnr(vim.fn.win_getid(vim.fn.tabpagewinnr(tabpagenr), tabpagenr))
          })

          -- Special case for Neogit
          if label == nil and utils.starts_with(tab_curr_win_ft, "Neogit") then
            label = tab_curr_win_ft
          end

          table.insert(
            tabs,
            table.concat({
              "%" .. tabpagenr .. "T",
              is_active and "%#Tb_TabActive#" or "%#Tb_TabInactive#",
              "   ",
              tabpagenr,
              label ~= nil and (": " .. label) or " [No Label]",
              "   ",
              "%T",
            })
          )
        end

        return table.concat({
          "%#NeoTreeNormal#",
          blocks.file_tree_offset(),

          "%#Tb_Reset#%=",
          table.concat(tabs),
          "%#Tb_Reset#%=",

          -- We want to always justify the tabs to the middle
          blocks.file_tree_offset(),
        })
      end,
    },
  },
})
