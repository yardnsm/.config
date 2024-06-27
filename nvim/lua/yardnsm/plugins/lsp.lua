local config = require("yardnsm.lsp")
local utils = require("yardnsm.utils")

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = utils.float_borders_style,
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",

    opts = {
      ensure_installed = config.required_servers,
    },

    config = function(_, opts)
      local installer = require("mason-lspconfig")

      -- Make the setup more dynamic. When a server loads, check for an appropriate config file then
      -- load it.
      installer.setup_handlers({
        config.setup_handler,
      })
    end,
  },

  -- Dev setup for neovim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",

    dependencies = {
      { "Bilal2453/luvit-meta", lazy = true },
    },

    opts = {
      library = {
        "~/dev/nvim-base46",
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",

    event = utils.LazyFile,

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    ---@type Base46Handler
    setup_base46 = function(c, hi)
      hi.LspReferenceText = { guibg = c.one_bg3 }
      hi.LspReferenceRead = "LspReferenceText"
      hi.LspReferenceWrite = "LspReferenceText"
    end,

    config = function()
      config.setup()

      -- Setup manually installed LSPs here, for example:
      -- config.setup_handler("gopls")
    end,
  },
}
