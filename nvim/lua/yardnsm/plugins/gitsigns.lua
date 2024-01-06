return {
  {
    "lewis6991/gitsigns.nvim",

    lazy = false,

    opts = {
      current_line_blame = false,

      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
      },
    },

    keys = {
      { "]c", function() require("gitsigns").next_hunk() end },
      { "[c", function() require("gitsigns").prev_hunk() end },
    },

    setup_base46 = function(c, hi)
      hi.GitSignsAdd = { guifg = c.vibrant_green }
      hi.GitSignsChange = { guifg = c.blue }
      hi.GitSignsDelete = { guifg = c.red }
    end
  }
}
