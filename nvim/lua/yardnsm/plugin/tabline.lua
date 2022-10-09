local status_ok, tabline = pcall(require, "tabline_framework")
if not status_ok then
  return
end

-- I don't use tabs that much, and having a line at the top that shows my open buffers seems
-- redundant. When I *do* use tabs, the default tabline is a mess. Hence -- this beauty!

tabline.setup({
  hl = { fg = '#abb2bf', bg = '#181A1F' },
  hl_sel = { fg = '#abb2bf', bg = '#282c34'},
  hl_fill = { fg = '#75b5aa', bg = '#101010'},

  render = function (f)
    f.add_spacer()
    f.add('Tabs: ')

    f.make_tabs(function(info)
      f.add('  ' .. info.index .. '  ')
    end)
  end
})
