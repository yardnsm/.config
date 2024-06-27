return {
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
