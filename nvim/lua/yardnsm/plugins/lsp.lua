return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  -- Dev setup for neovim
  {
    "folke/neodev.nvim",
    opts = {},
  },

  -- LSP shit
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },

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
