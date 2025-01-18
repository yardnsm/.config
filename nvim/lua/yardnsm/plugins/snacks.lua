return {
  "folke/snacks.nvim",

  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },
    gitbrowse = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },

    statuscolumn = {
      enabled = true,
      left = { "git", "mark", "sign" }, -- priority of signs on the left (high to low)
      right = { "fold" },
    },
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
