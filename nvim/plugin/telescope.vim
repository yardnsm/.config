lua << EOF
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "package-lock.json"
    },

    mappings = {
      i = {
        ["<ESC>"] = "close"
      }
    }
  }
})
EOF

" Highlights

highlight link TelescopeBorder FloatBorder

" Mappings

nnoremap <leader>a :Telescope live_grep<CR>
nnoremap <leader>b :Telescope buffers theme=ivy<CR>
nnoremap <leader>m :Telescope marks theme=dropdown<CR>

" If inside a git repo, use :GFiles
if isdirectory(".git")
  nmap <C-p> :Telescope git_files<CR>
else
  " otherwise, use :FZF
  nmap <C-p> :Telescope find_files<CR>
endif
