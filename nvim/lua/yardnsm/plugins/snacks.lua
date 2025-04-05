-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "snacks_*",
--   callback = function(evt)
--     print(vim.inspect(evt))
--     vim.schedule(function()
--       local winid = vim.fn.bufwinid(evt.buf)
--       vim.api.nvim_set_option_value("winbar", "hey %y", {win=winid})
--     end)
--   end,
-- })

return {
  "folke/snacks.nvim",

  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    gitbrowse = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },

    rename = { enabled = true },
    input = { enabled = true },

    statuscolumn = {
      enabled = true,
      left = { "git", "mark", "sign" }, -- priority of signs on the left (high to low)
      right = { "fold" },
    },

    picker = {
      layout = {
        layout = {
          backdrop = false,
        },
      },
    },

    -- Disabled section
    animate = { enabled = false },
  },

  keys = {
    {
      "<leader>gb",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "gb",
      function()
        Snacks.gitbrowse()
      end,
      mode = "v",
      desc = "Git Browse (Visual)",
    },

    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
  },
}
