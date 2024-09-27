local utils = require("yardnsm.utils")

return {

  -- Devicons for eyecandy
  {
    "echasnovski/mini.icons",
    version = false,
    opts = {},

    config = function(_, opts)
      require("mini.icons").setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end,
  },

  -- TODO remove
  -- { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Lua libraries, used by some plugins
  { "nvim-lua/plenary.nvim",     lazy = true },

  {
    "norcalli/nvim-colorizer.lua",
    init = function()
      -- This is already setted in init.vim, but since this file is being sourced *before* init.vim,
      -- it is required in order to not throw errors.
      vim.o.termguicolors = true
    end,
  },

  -- Highlights matching tags
  {
    "Valloric/MatchTagAlways",
    ft = { "html", "xhtml", "xml", "javascript.jsx", "typescript.jsx", "javascriptreact", "typescriptreact" },
  },

  -- Enable support for editorconfig files
  { "gpanders/editorconfig.nvim" },

  -- Wiki for vim
  {
    "vimwiki/vimwiki",
    enabled = false,
  },

  -- Nice buffer switching UI
  {
    "ghillb/cybu.nvim",

    opts = {
      style = {
        border = utils.float_borders_style,
        padding = 4,
      },
    },

    keys = {
      { "[b", "<Plug>(CybuPrev)" },
      { "]b", "<Plug>(CybuNext)" },
    },
  },

  {
    "kosayoda/nvim-lightbulb",

    opts = {
      sign = {
        priority = 80,
        text = "",
      },
    },
  },

  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        display = {
          progress_icon = {
            pattern = "dots",
          },
        },
        ignore = {
          "null-ls",
        },
      },
    },
  },
}
