return {

  -- Devicons for eyecandy
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Lua libraries, used by some plugins
  { "nvim-lua/plenary.nvim", lazy = true },

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
  }
}
