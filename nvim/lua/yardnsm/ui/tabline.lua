---@type Line
local Line = require("yardnsm.ui.line")
local tab_label = require("yardnsm.misc.tab-label")

-- I don't use tabs that much, and having a line at the top that shows my open buffers seems
-- redundant. When I *do* use tabs, the default tabline is a mess. Hence -- this minimal tabline!

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

          table.insert(tabs, table.concat({
            is_active and "%#Tb_TabActive#" or "%#Tb_TabInactive#",
            "   ",
            tabpagenr,
            label ~= nil and (": " .. label) or " [No Label]",
            "   ",
          }))
        end

        return table.concat({
          "%#Tb_Reset#%=",
          table.concat(tabs),
        })
      end
    },
  },
})
