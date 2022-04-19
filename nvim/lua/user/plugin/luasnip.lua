-- vim: set foldmethod=marker foldlevel=0:

local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

local get_comment_format = function ()
  local commentstring = vim.bo.commentstring

  if string.sub(commentstring, -1) == "%s" then
    c = string.sub(commentstring, -2)
    return { c, c, c, "" }
  end

  -- Default
  return { "#", "#", "#", "" }
end

local get_comment_char = function ()
  return string.gsub(get_comment_format()[1], '%s+', '')
end

local get_comment_separator = function ()
  local prefix = get_comment_char() .. ' '
  local textwidth = vim.bo.textwidth

  return prefix .. string.rep('-', textwidth - #prefix)
end

-- all {{{

ls.add_snippets("all", {
  s({
    trig = 'vml',
    dscr = 'Foldmarker modeline'
  }, {
      f(get_comment_char),
      t({" vim: set foldmethod=marker foldlevel=0:", ""}),
  }),

  s({
    trig = 'scc',
    dscr = 'Separator comment'
  }, {
      f(get_comment_separator),
      t({"", ""}),
  }),

  s({
    trig = 'pcc',
    dscr = 'Primary comment'
  }, {
      f(get_comment_separator),
      t({"", ""}),
      i(1, "Comment Text"),
  }),

  s({
    trig = 'fcc',
    dscr = 'Foldable section'
  }, {
      f(get_comment_char),
      t(" "),
      i(1, "Section Text"),
      t({" {{{", "", "", "", ""}),
      f(get_comment_char),
      t({" }}}"}),
  }),

  s('date', {
    f(function () return vim.fn.strftime("%Y-%m-%d") end)
  }),

  s('ddate', {
    f(function () return vim.fn.strftime("%B %d, %Y") end)
  }),

  s(':cmd', { t('⌘') }),
  s(':alt', { t('⌥') }),
  s(':shift', { t('⇧') }),
  s(':esc', { t('⎋') }),
  s(':caps', { t('⇪') }),
  s(':ret', { t('⏎') }),
  s(':del', { t('⌫') }),
  s(':tab', { t('⇥') }),
  s(':shrug', { t('¯\\_(ツ)_/¯') }),
})

-- }}}
-- html {{{

ls.add_snippets("html", {
  s("html5", {
    fmt([[<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title>{title}</title>
  </head>
  <body>
    {body}
  </body>
</html>]], {
        title = i(2, "Title"),
        body = i(1),
      })
  })
})

-- }}}
-- javascript {{{

ls.add_snippets("javascript", {
  s("iife", {
    fmt([[
(function () {
  []
})();
    ]], { i(1) }, { delimiters = "[]" })
  }),

  s("edl", { t("// eslint-disable-line") }),
  s("edn", { t("// eslint-disable-next-line") }),
})

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })

-- }}}
-- javascript {{{

ls.add_snippets("markdown", {
  s("code", {
    t("```"),
    i(1, "bash"),
    t({ "", "" }),
    i(2, "echo hello"),
    t({ "", "```" })
  }),

  s("a", fmt("[{1}]({2})", {
    i(1, "text"),
    i(2, "https://"),
  })),

  s("img", fmt("![{1}]({2})", {
    i(1, "alt"),
    i(2, "https://"),
  })),
})

-- }}}
