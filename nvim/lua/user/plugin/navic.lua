local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

vim.g.navic_silence = true

navic.setup({
  highlight = false,
  separator = ' > '
})
