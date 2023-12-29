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
    }
  }
}
