local status_ok, autopairs = pcall(require, "nvim-autopairs")
local utils = require("yardnsm.utils")
if not status_ok then
  return
end

local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

autopairs.setup({
  check_ts = true,
  map_bs = false,
  enable_moveright = false,
  enable_afterquote = false,
})

-- Remove for quotes
autopairs.remove_rule('"')
autopairs.remove_rule("`")
autopairs.remove_rule("'")

-- Make every rule happend only on <CR>, similarly to vim-closer.
local pairs = {
  '"""',
  "```",
}

for _, rule in ipairs(autopairs.config.rules) do
  if utils.has_value(pairs, rule.start_pair) then
    rule:end_wise()
  end
end

-- vim-closer replacement
-- TODO replicate the auto semicolon insertion

-- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
local get_closing_for_line = function(line)
  local i = -1
  local clo = ""

  while true do
    i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
    if i == nil then
      break
    end
    local ch = string.sub(line, i, i)
    local st = string.sub(clo, 1, 1)

    if ch == "{" then
      clo = "}" .. clo
    elseif ch == "}" then
      if st ~= "}" then
        return ""
      end
      clo = string.sub(clo, 2)
    elseif ch == "(" then
      clo = ")" .. clo
    elseif ch == ")" then
      if st ~= ")" then
        return ""
      end
      clo = string.sub(clo, 2)
    elseif ch == "[" then
      clo = "]" .. clo
    elseif ch == "]" then
      if st ~= "]" then
        return ""
      end
      clo = string.sub(clo, 2)
    end
  end

  return clo
end

autopairs.remove_rule("(")
autopairs.remove_rule("{")
autopairs.remove_rule("[")

autopairs.add_rule(Rule("[%(%{%[]", "")
  :use_regex(true)
  :replace_endpair(function(opts)
    return get_closing_for_line(opts.line)
  end)
  :end_wise(function(opts)
    -- Do not endwise if there is no closing
    return get_closing_for_line(opts.line) ~= ""
  end))
