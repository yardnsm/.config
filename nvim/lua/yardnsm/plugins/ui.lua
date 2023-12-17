return {

  -- Nice buffer switching UI
  {
    "ghillb/cybu.nvim",

    opts = {
      style = {
        border = "rounded",
        padding = 4,
      },
    },

    keys = {
      { "[b", "<Plug>(CybuPrev)" },
      { "]b", "<Plug>(CybuNext)" },
    }
  },

  {
    "kosayoda/nvim-lightbulb",

    opts = {
      sign = {
        priority = 80,
        text = ""
      }
    },
  },

  {
    "j-hui/fidget.nvim",
    -- opts = {
    --   text = {
    --     spinner = "dots",
    --   },

    --   sources = {
    --     ["null-ls"] = {
    --       ignore = true,
    --     },
    --   },
    -- }
  }
}
