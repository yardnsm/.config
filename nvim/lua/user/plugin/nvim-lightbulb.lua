local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
  return
end

lightbulb.setup({
  sign = {
    priority = 80
  }
})

vim.fn.sign_define("LightBulbSign", { text = "", texthl = "DiagnosticSignWarn" })

-- NOTE: the autocmd is defined in ../lsp/init.lua
