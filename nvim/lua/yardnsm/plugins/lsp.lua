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
