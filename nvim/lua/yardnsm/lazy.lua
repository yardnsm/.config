-- vim: set foldmethod=marker foldlevel=0:
-- Plugins Setup

-- lazy.nvim bootstrap {{{

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- }}}

-- TODO make lazy rounded borders (and export it to some global config is I'm here anyways)

require("lazy").setup({
  spec = {
    { import = "yardnsm.plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },

  checker = { enabled = false },
  change_detection = { enabled = false },

  -- Try to load one of these colorschemes when starting an installation during startup
  install = { colorscheme = { "base46-classic-dark", "habamax" } },

  -- Disable some rtp plugins, this is taken from LazyVim's Starter
  performance = {
    rtp = {
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
})
