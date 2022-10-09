local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup({
  keymaps = {},
  current_line_blame = false,

  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
  }
})

-- Mappings

vim.keymap.set("n", "]c", gitsigns.next_hunk)
vim.keymap.set("n", "[c", gitsigns.prev_hunk)
