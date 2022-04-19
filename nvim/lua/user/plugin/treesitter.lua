local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "swift", "phpdoc" },

  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = { "yaml" },
  },

  playground = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  autotag = {
    enable = true,
  },

  endwise = {
    enable = true,
  },
})
