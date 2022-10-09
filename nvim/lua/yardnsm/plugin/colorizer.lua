local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

-- This is already setted in init.vim, but since this file is being sourced *before* init.vim, it is
-- required in order to not throw errors.
vim.o.termguicolors = true

colorizer.setup()
