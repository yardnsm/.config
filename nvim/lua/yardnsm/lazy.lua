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

-- Hook plugin's spec to allow setting plugins-specific hlgroups for base46;
-- This allows to add an autocmd to be run when the colorscheme is changed to a base46 one.

-- base46 hooks {{{

local base16_utils = require("yardnsm.misc.base16-utils")

local hook_plugin_config = function(fn)
  local Loader = require("lazy.core.loader")
  local _old_config = Loader.config

  Loader.config = function(plugin)
    fn(plugin)

    return _old_config(plugin)
  end
end

hook_plugin_config(function(plugin)
  if plugin.setup_base46 == nil then
    return
  end

  base16_utils.attach_handler("base46-*", plugin.setup_base46)
end)

-- }}}

require("lazy").setup({
  spec = {
    { import = "yardnsm.plugins" },
  },

  defaults = {
    lazy = false,
    version = false,
  },

  ui = {
    border = "rounded"
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
