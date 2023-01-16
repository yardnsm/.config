local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

local group = vim.api.nvim_create_augroup("deferredload", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = group,
  callback = function()
    vim.defer_fn(function()
      vim.cmd([[doautocmd User DeferredLoad]])
    end, 1)
  end,
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Optimizations
  use("lewis6991/impatient.nvim")
  use("dstein64/vim-startuptime") -- Profile startup

  -- Colors
  use("RRethy/nvim-base16")
  use("kyazdani42/nvim-web-devicons")

  -- File Tree
  use("kyazdani42/nvim-tree.lua")

  -- Lua libraries
  use("nvim-lua/plenary.nvim")

  -- LSP shit
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/null-ls.nvim")
  use("SmiteshP/nvim-navic")
  use({
    "filipdutescu/renamer.nvim",
    branch = "master",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- Telescope and friends
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    requires = {
      { "nvim-treesitter/playground", after = "nvim-treesitter" },
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
      { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },

      -- automatically close `end` blocks (`endif`, `done`, etc.)
      { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
    },
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    },
  })

  -- Language Support
  use("gpanders/editorconfig.nvim") -- enable support for editorconfig files
  use("folke/neodev.nvim") -- dev setup for neovim

  -- File types
  use("vimwiki/vimwiki") -- wiki for vim

  -- Tmux
  use({
    "christoomey/vim-tmux-navigator", -- navigation between tmux and bim splits
    { "roxma/vim-tmux-clipboard", event = "User DeferredLoad" }, -- integration for vim and tmux's clipboard
  })

  -- Snippets
  use("L3MON4D3/LuaSnip")

  -- UI
  use("ghillb/cybu.nvim")
  use("lewis6991/gitsigns.nvim") -- shows git diff in the gutter
  use("kosayoda/nvim-lightbulb")
  use("j-hui/fidget.nvim")
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "rafcamlet/tabline-framework.nvim", requires = "kyazdani42/nvim-web-devicons" })

  -- Goodies
  use("windwp/nvim-autopairs")
  use({ "norcalli/nvim-colorizer.lua", event = "User DeferredLoad" })

  use({
    "Valloric/MatchTagAlways",
    ft = { "html", "xhtml", "xml", "javascript.jsx", "typescript.jsx", "javascriptreact", "typescriptreact" },
  }) -- highlights matching tags

  -- Topoe's reserved area
  use({
    "tpope/vim-fugitive", -- a git wrapper for vim
    "tpope/vim-rhubarb", -- GitHub extension for vim-fugitive
    "tpope/vim-surround", -- easly work with surroundings
    "tpope/vim-commentary", -- comment stuff out
    "tpope/vim-unimpaired", -- some sensible bracket mappings
    "tpope/vim-repeat", -- enable repeating support (`.`) for plugin maps
    "tpope/vim-eunuch", -- some unix shell commands helper
  })

  -- macOS specific plugins
  if vim.fn.has("mac") then
    use({ "junegunn/vim-xmark", run = "make" })
  end

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)
