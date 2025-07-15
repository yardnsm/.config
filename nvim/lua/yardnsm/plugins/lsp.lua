local config = require("yardnsm.lsp")
local utils = require("yardnsm.utils")

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = utils.float_borders_style,
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = config.required_servers,
      automatic_enable = true,
    },
  },

  -- Dev setup for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",

    opts = {
      library = {
        "~/dev/nvim-base46",
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "snacks.nvim", words = { "Snacks" } },
      },
    },
  },

  -- Add lazydev to blink.cmp
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",

    config = function()
      config.setup()

      -- Setup manually installed LSPs here, for example:
      -- vim.lsp.enable("gopls")
      -- vim.lsp.enable("nxls")
    end,
  },
}
