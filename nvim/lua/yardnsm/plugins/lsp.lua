local config = require("yardnsm.lsp")

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },

    setup_base46 = function(c, hi)
      hi.MasonNormal = "Normal"
      hi.MasonHeader = { guibg = c.red, guifg = c.black }
      hi.MasonHighlight = { guifg = c.blue }
      hi.MasonHighlightBlock = { guifg = c.black, guibg = c.green }
      hi.MasonHighlightBlockBold = { link = "MasonHighlightBlock" }
      hi.MasonHeaderSecondary = { link = "MasonHighlightBlock" }
      hi.MasonMuted = { guifg = c.light_grey }
      hi.MasonMutedBlock = { guifg = c.light_grey, guibg = c.one_bg }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",

    opts = {
      ensure_installed = config.required_servers,
    },

    config = function(_, opts)
      local installer = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      -- Make the setup more dynamic. When a server loads, check for an appropriate config file then
      -- load it.
      installer.setup_handlers({
        function(server_name)
          local capabilities = config.make_capabilities()

          local server_opts = {
            on_attach = config.on_attach,
            capabilities = capabilities,
          }

          local lsp_options_status_ok, lsp_options = pcall(require, "yardnsm.lsp.settings." .. server_name)
          if lsp_options_status_ok then
            server_opts = vim.tbl_deep_extend("force", lsp_options, server_opts)
          end

          lspconfig[server_name].setup(server_opts)
        end,
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

    config = function()
      config.setup()
    end
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
