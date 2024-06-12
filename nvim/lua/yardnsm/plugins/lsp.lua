local config = require("yardnsm.lsp")

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
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
        config.setup_handler
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Dev setup for neovim
      { "folke/neodev.nvim", opts = {} },

      -- Mason shit
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    setup_base46 = function(c, hi)
      hi.LspReferenceText = { guibg = c.one_bg3 }
      hi.LspReferenceRead = "LspReferenceText"
      hi.LspReferenceWrite = "LspReferenceText"
    end,

    config = function()
      config.setup()

      -- Setup manually installed LSPs
      -- config.setup_handler("gopls")
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      local null_ls = require("null-ls")

      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions
      local hover = null_ls.builtins.hover

      opts.sources = vim.list_extend(opts.sources or {}, {
        formatting.prettier,
        formatting.stylua,
        formatting.black.with({ extra_args = { "--fast" } }),

        diagnostics.shellcheck,
        diagnostics.zsh,
        diagnostics.flake8,

        code_actions.shellcheck,

        -- hover.dictionary,
      })
    end,
  },

  -- Additional setup in ../lsp/init.lua
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = false,
      separator = " > ",
    },
    init = function()
      vim.g.navic_silence = true
    end,
  },
}
